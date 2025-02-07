from app import db

db.metadata.clear()  # Hapus metadata lama sebelum deklarasi model

class Schedule(db.Model):
    __tablename__ = 'schedule'
    __table_args__ = {'extend_existing': True}  # Tambahkan ini supaya tidak bentrok

    id = db.Column(db.Integer, primary_key=True)
    day = db.Column(db.String(10), nullable=False)
    time_range = db.Column(db.String(20), nullable=False)
    availability = db.Column(db.Integer, nullable=False)
