# app/__init__.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_caching import Cache

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://postgres:example@db:5432/ecommerce'
app.config['CACHE_TYPE'] = 'redis'
app.config['CACHE_REDIS_URL'] = 'redis://redis:6379/0'

db = SQLAlchemy(app)
cache = Cache(app)

from app import routes
