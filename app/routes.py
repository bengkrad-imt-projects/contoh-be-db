from flask import jsonify, request
from app import app
from app.schedule_utils import ScheduleManager

@app.route('/')
def home():
    return jsonify({"message": "Welcome to the Schedule API"}), 200

@app.route('/selected-schedule', methods=['GET'])
def get_schedule():
    return jsonify(ScheduleManager.get_schedule())

@app.route('/selected-schedule', methods=['POST'])
def update_schedule():
    data = request.get_json()

    if not data or "id" not in data or "jadwal" not in data:
        return jsonify({"error": "Invalid data format"}), 400

    ScheduleManager.update_schedule(data["jadwal"])
    return jsonify({"message": "Schedule updated successfully"}), 200

@app.route('/toggle-time', methods=['PATCH'])
def toggle_time():
    data = request.get_json()

    if not data or "day" not in data or "time_range" not in data:
        return jsonify({"error": "Invalid data format"}), 400

    ScheduleManager.toggle_time(data["day"], data["time_range"])
    return jsonify({"message": "Time toggled successfully"}), 200

@app.route('/batch-update', methods=['PATCH'])
def batch_update():
    data = request.get_json()

    if not data or "updates" not in data:
        return jsonify({"error": "Invalid data format"}), 400

    ScheduleManager.batch_update(data["updates"])
    return jsonify({"message": "Batch update successful"}), 200


