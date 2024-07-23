from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import redis

db = SQLAlchemy()
cache = redis.Redis(host='redis', port=6379)

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@db:5432/ecommerce'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)

    from .routes import main
    app.register_blueprint(main)

    return app
