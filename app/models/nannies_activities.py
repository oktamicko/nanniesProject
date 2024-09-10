# app/models/nannies_activities.py
from app.extensions import db


class NanniesActivities(db.Model):
    __tablename__ = "nannies_activities"

    id = db.Column(db.Integer, primary_key=True)
    nanny_id = db.Column(db.Integer, db.ForeignKey("nanny.id"), nullable=False)
    activity_id = db.Column(db.Integer, db.ForeignKey("activity.id"), nullable=False)
    date = db.Column(db.Date, nullable=False)

    # Define relationships to nanny and activity
    nanny = db.relationship("Nanny", backref="nannies_activities", lazy=True)
    activity = db.relationship("Activity", backref="nannies_activities", lazy=True)
