from app import db
from app.models import Schedule

class ScheduleManager:
    @staticmethod
    def get_schedule():
        """Mengambil data jadwal dari database dan mengubahnya ke format JSON."""
        schedules = Schedule.query.all()
        data = {day: {} for day in ["Senin", "Selasa", "Rabu", "Kamis", "Jumat"]}

        for schedule in schedules:
            data[schedule.day][schedule.time_range] = schedule.availability

        return [{"id": "0", "jadwal": [{day: data[day]} for day in data]}]

    @staticmethod
    def update_schedule(schedule_data):
        """Menghapus jadwal lama dan menyimpan yang baru."""
        Schedule.query.delete()  # Hapus semua data lama

        for day_entry in schedule_data:
            for day, times in day_entry.items():
                for time_range, availability in times.items():
                    db.session.add(Schedule(day=day, time_range=time_range, availability=availability))

        db.session.commit()


        db.session.commit()

    @staticmethod
    def toggle_time(day, time_range):
        """Mengubah status ketersediaan waktu tertentu."""
        schedule = Schedule.query.filter_by(day=day, time_range=time_range).first()
        if schedule:
            schedule.availability = 0 if schedule.availability == 1 else 1
        else:
            schedule = Schedule(day=day, time_range=time_range, availability=1)
            db.session.add(schedule)

        db.session.commit()

    @staticmethod
    def batch_update(updates):
        """Batch update untuk beberapa jadwal sekaligus."""
        for item in updates:
            schedule = Schedule.query.filter_by(day=item["day"], time_range=item["time_range"]).first()
            if schedule:
                schedule.availability = item["availability"]
            else:
                db.session.add(Schedule(**item))

        db.session.commit()
