from app.extensions import db


class Nanny(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), nullable=False)
    email = db.Column(db.String(100), nullable=False, unique=True)
    phone_number = db.Column(db.String(20), nullable=False)
    sex = db.Column(db.String(10), nullable=False)
    availability = db.Column(db.String(50), nullable=False)
    address = db.Column(db.Text, nullable=False)
    age = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f'<Nanny "{self.name}">'
