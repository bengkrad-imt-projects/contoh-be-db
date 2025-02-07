from app import app, db

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Membuat tabel di database jika belum ada
    app.run(host="0.0.0.0", port=3005, debug=True)
