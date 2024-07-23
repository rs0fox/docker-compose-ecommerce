# app/routes.py
from flask import render_template
from app import app, db
from app.models import Product

@app.route('/')
def index():
    products = Product.query.all()
    return render_template('index.html', products=products)
