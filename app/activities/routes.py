# app/activities/routes.py
from flask import render_template, request, redirect, url_for
from app.activities import bp
from app.extensions import db
from app.models.activity import Activity


@bp.route("/")
def index():
    activities = Activity.query.all()
    return render_template("activities/index.html", activities=activities)


@bp.route("/form", methods=["GET", "POST"])
def form():
    if request.method == "POST":
        if "id" in request.form:
            # Update Data Aktivitas
            activity_id = int(request.form["id"])
            activity = Activity.query.get(activity_id)
            if activity is None:
                return "Aktivitas tidak ditemukan", 404

            activity.activity_name = request.form["activity_name"]
            activity.age_group = request.form["age_group"]
            activity.location = request.form["location"]

            db.session.commit()
            return redirect(url_for("activities.index"))

        else:
            # Tambah Data Baru
            new_activity = Activity(
                activity_name=request.form["activity_name"],
                age_group=request.form["age_group"],
                location=request.form["location"],
            )

            db.session.add(new_activity)
            db.session.commit()

            return redirect(url_for("activities.index"))

    return render_template("activities/form.html")


@bp.route("/delete/<int:activity_id>", methods=["POST"])
def delete_activity(activity_id):
    activity = Activity.query.get(activity_id)
    if activity is None:
        return "Aktivitas tidak ditemukan", 404

    db.session.delete(activity)
    db.session.commit()

    return redirect(url_for("activities.index"))


@bp.route("/update/<int:activity_id>", methods=["GET", "POST"])
def update_activity(activity_id):
    activity = Activity.query.get(activity_id)
    if activity is None:
        return "Aktivitas tidak ditemukan", 404

    if request.method == "POST":
        activity.activity_name = request.form["activity_name"]
        activity.age_group = request.form["age_group"]
        activity.location = request.form["location"]

        db.session.commit()
        return redirect(url_for("activities.index"))

    return render_template("activities/form.html", activity=activity)
