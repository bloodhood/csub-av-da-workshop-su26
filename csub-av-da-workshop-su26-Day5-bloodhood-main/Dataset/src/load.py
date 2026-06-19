"""
Step 2 – Load CSV data into the 3NF SQLite database.
Usage:  python load_data.py
"""

import sqlite3
import csv
import os

_here   = os.path.dirname(os.path.abspath(__file__))
_root   = os.path.join(_here, "..")          # Dataset/Dataset/
CSV_NAME = "healthcare-dataset-stroke-data.csv"
CSV_PATH = next(
    (p for p in [
        os.path.join(_root, CSV_NAME),
        os.path.join(_root, "..", "data", CSV_NAME),
    ] if os.path.exists(p)),
    os.path.join(_root, CSV_NAME)
)
DB_PATH = os.path.join(_root, "stroke.db")
SCHEMA  = os.path.join(_here, "schema.sql")


def get_or_create(cursor, table, name_col, id_col, value):
    cursor.execute(f"SELECT {id_col} FROM {table} WHERE {name_col} = ?", (value,))
    row = cursor.fetchone()
    if row:
        return row[0]
    cursor.execute(f"INSERT INTO {table} ({name_col}) VALUES (?)", (value,))
    return cursor.lastrowid


def load():
    conn = sqlite3.connect(DB_PATH)
    cur  = conn.cursor()
    cur.execute("PRAGMA foreign_keys = ON;")

    with open(SCHEMA, "r") as f:
        cur.executescript(f.read())

    inserted = skipped = 0

    with open(CSV_PATH, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            try:
                patient_id = int(row["id"])
                gender     = row["gender"].strip()
                age        = float(row["age"])
                married    = row["ever_married"].strip()
                work       = row["work_type"].strip()
                residence  = row["Residence_type"].strip()
                glucose    = float(row["avg_glucose_level"]) if row["avg_glucose_level"] not in ("", "N/A") else None
                bmi_raw    = row["bmi"].strip()
                bmi        = float(bmi_raw) if bmi_raw not in ("", "N/A") else None
                smoking    = row["smoking_status"].strip()
                hypert     = int(row["hypertension"])
                heart      = int(row["heart_disease"])
                stroke     = int(row["stroke"])

                wt_id  = get_or_create(cur, "dim_work_type",      "work_type_name",      "work_type_id",      work)
                rt_id  = get_or_create(cur, "dim_residence_type", "residence_type_name", "residence_type_id", residence)
                ss_id  = get_or_create(cur, "dim_smoking_status", "smoking_status_name", "smoking_status_id", smoking)

                cur.execute(
                    "INSERT OR IGNORE INTO patient (patient_id, gender, age, ever_married, work_type_id, residence_type_id) "
                    "VALUES (?, ?, ?, ?, ?, ?)",
                    (patient_id, gender, age, married, wt_id, rt_id)
                )
                cur.execute(
                    "INSERT OR IGNORE INTO patient_health "
                    "(patient_id, hypertension, heart_disease, avg_glucose_level, bmi, smoking_status_id, stroke) "
                    "VALUES (?, ?, ?, ?, ?, ?, ?)",
                    (patient_id, hypert, heart, glucose, bmi, ss_id, stroke)
                )
                inserted += 1
            except Exception as e:
                print(f"  Skipped row {row.get('id', '?')}: {e}")
                skipped += 1

    conn.commit()
    conn.close()
    print(f"Done. Inserted: {inserted}  Skipped: {skipped}")
    print(f"Database: {DB_PATH}")


if __name__ == "__main__":
    load()
