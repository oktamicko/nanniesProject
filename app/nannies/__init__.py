from flask import Blueprint

bp = Blueprint("nannies", __name__)

from app.nannies import routes
