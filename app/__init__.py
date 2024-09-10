from flask import Flask
from flask_migrate import Migrate
from config import Config
from app.extensions import db

migrate = Migrate()


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    # Initialize Flask Extension
    db.init_app(app)
    migrate.init_app(app, db)

    # Register blueprints
    from app.main import bp as main_bp

    app.register_blueprint(main_bp)

    from app.nannies import bp as nannies_bp

    app.register_blueprint(nannies_bp, url_prefix="/nannies")

    from app.activities import bp as activities_bp

    app.register_blueprint(activities_bp, url_prefix="/activities")

    @app.route("/test/")
    def test_page():
        return "<h1>Testing the Flask Application Factory Pattern</h1>"

    return app
