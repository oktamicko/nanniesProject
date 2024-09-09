from flask import render_template
from app.nannies import bp


@bp.route("/")
def index():

    nannies = [
        {"id": 1, "name": "Nanny 1", "age": 30},
        {"id": 2, "name": "Nanny 2", "age": 25},
        # Tambahkan data nannies lainnya
    ]
    return render_template("nannies/index.html", nannies=nannies)
