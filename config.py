import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    SECRET_KEY = os.environ.get("SECRET_KEY")
    SQLALCHEMY_DATABASE_URI = (
        os.environ.get("DATABASE_URI") or "mysql+pymysql://okta:okta@localhost/coba"
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False


# class Config:
#     SECRET_KEY = os.environ.get("SECRET_KEY")
#     SQLALCHEMY_DATABASE_URI = (
#         os.environ.get("DATABASE_URI")
#         or "mysql+pymysql://root:okta_password@mysql-container:3306/coba"
#     )
#     SQLALCHEMY_TRACK_MODIFICATIONS = False
