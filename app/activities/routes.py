from flask import render_template
from app.activities import bp


@bp.route("/")
def index():

    activities = [
        {
            "id": 1,
            "name": "Aktivitas 1",
            "start_date": "2023-01-01",
            "end_date": "2023-01-15",
        },
        {
            "id": 2,
            "name": "Aktivitas 2",
            "start_date": "2023-02-01",
            "end_date": "2023-02-28",
        },
        # Tambahkan data aktivitas lainnya
    ]
    return render_template("activities/index.html", activities=activities)
