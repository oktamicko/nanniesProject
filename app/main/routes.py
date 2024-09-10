from flask import Blueprint, render_template, request, url_for, redirect, flash
from app.models.nannies_activities import NanniesActivities
from app.models.activity import Activity
from app.models.nanny import Nanny
from app.extensions import db
from app.main import bp


@bp.route("/")
def index():
    # Query semua data dari tabel NanniesActivities
    nannies_activities = NanniesActivities.query.all()
    return render_template("index.html", nannies_activities=nannies_activities)


@bp.route("/add_nanny_activity", methods=["GET", "POST"])
@bp.route("/add_nanny_activity/<int:id>", methods=["GET", "POST"])
def add_or_update_nanny_activity(id=None):
    nanny_activity = NanniesActivities.query.get(id) if id else None

    if request.method == "POST":
        if nanny_activity is None:  # Tambahkan data baru
            nanny_activity = NanniesActivities(
                nanny_id=request.form["nanny_id"],
                activity_id=request.form["activity_id"],
                date=request.form["date"],
            )
            db.session.add(nanny_activity)
        else:  # Update data yang sudah ada
            nanny_activity.nanny_id = request.form["nanny_id"]
            nanny_activity.activity_id = request.form["activity_id"]
            nanny_activity.date = request.form["date"]

        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()

        return redirect(url_for("main.index"))

    # Jika metode GET, tampilkan form untuk add atau update
    nannies = Nanny.query.all()
    activities = Activity.query.all()
    return render_template(
        "add_or_update_nanny_activity.html",
        nanny_activity=nanny_activity,
        nannies=nannies,
        activities=activities,
    )


@bp.route("/delete_nanny_activity/<int:id>", methods=["POST"])
def delete_nanny_activity(id):
    nanny_activity = NanniesActivities.query.get(id)
    if nanny_activity is None:
        return redirect(url_for("main.index"))

    try:
        db.session.delete(nanny_activity)
        db.session.commit()
    except Exception as e:
        db.session.rollback()

    return redirect(url_for("main.index"))
