from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_caching import Cache

db = SQLAlchemy()
cache = Cache(config={'CACHE_TYPE': 'simple'})

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.Config')

    db.init_app(app)
    cache.init_app(app)

    with app.app_context():
        from . import routes  # Import routes
        db.create_all()  # Create database tables for our data models

    return app
