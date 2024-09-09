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
    return render_template("nannies/form.html")
