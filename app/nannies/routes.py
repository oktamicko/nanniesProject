from flask import render_template, request, url_for, redirect
from app.nannies import bp
from app.extensions import db
from app.models.nanny import Nanny


@bp.route("/")
def index():
    nannies = Nanny.query.all()
    return render_template("nannies/index.html", nannies=nannies)


@bp.route("/form", methods=["GET", "POST"])
def form():
    if request.method == "POST":
        new_nanny = Nanny(
            name=request.form["name"],
            email=request.form["email"],
            phone_number=request.form["phone_number"],
            sex=request.form["sex"],
            availability=request.form["availability"],
            address=request.form["address"],
            age=int(request.form["age"]),
        )
        db.session.add(new_nanny)
        db.session.commit()
        return redirect(url_for("nannies.index"))
    return render_template("nannies/form.html")


@bp.route("/delete/<int:nanny_id>", methods=["POST"])
def delete_nanny(nanny_id):
    nanny = Nanny.query.get(nanny_id)
    if nanny is None:
        return "Nanny tidak ditemukan", 404

    db.session.delete(nanny)
    db.session.commit()

    return redirect(url_for("nannies.index"))


@bp.route("/update/<int:nanny_id>", methods=["GET", "POST"])
def update_nanny(nanny_id):
    nanny = Nanny.query.get(nanny_id)
    if nanny is None:
        return "Nanny tidak ditemukan", 404

    if request.method == "POST":
        nanny.name = request.form["name"]
        nanny.email = request.form["email"]
        nanny.phone_number = request.form["phone_number"]
        nanny.sex = request.form["sex"]
        nanny.availability = request.form["availability"]
        nanny.address = request.form["address"]
        nanny.age = int(request.form["age"])

        db.session.commit()
        return redirect(url_for("nannies.index"))

    return render_template("nannies/form.html", nanny=nanny)
