from flask import Blueprint, jsonify
from .models import Product
from . import cache

main = Blueprint('main', __name__)

@main.route('/')
def home():
    return 'Welcome to the e-commerce site!'

@main.route('/products')
def get_products():
    products = Product.query.all()
    return jsonify([{"id": p.id, "name": p.name, "price": p.price} for p in products])

@main.route('/cache')
def test_cache():
    cache.set('test', 'This is a test')
    return cache.get('test')
