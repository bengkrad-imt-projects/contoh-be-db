from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from app.config import Config
from flask_cors import CORS
from flask_migrate import Migrate

app = Flask(__name__)
CORS(app)  # Mengizinkan akses dari frontend
app.config.from_object(Config)

db = SQLAlchemy(app)

from app import app, db  # Pastikan app dan db sudah diimport
migrate = Migrate(app, db)

from app import routes  # Import route setelah db dibuat
