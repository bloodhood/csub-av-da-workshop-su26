-- ============================================================
-- Healthcare Stroke Dataset -- 3NF Normalized Schema
-- Step 1: Database Schema Creation
-- ============================================================

-- Drop existing tables (in reverse dependency order)
DROP TABLE IF EXISTS patient_health;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS dim_smoking_status;
DROP TABLE IF EXISTS dim_residence_type;
DROP TABLE IF EXISTS dim_work_type;

-- ── Dimension Tables ────────────────────────────────────────

CREATE TABLE dim_work_type (
    work_type_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    work_type_name TEXT    NOT NULL UNIQUE
);

CREATE TABLE dim_residence_type (
    residence_type_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    residence_type_name TEXT    NOT NULL UNIQUE
);

CREATE TABLE dim_smoking_status (
    smoking_status_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    smoking_status_name TEXT    NOT NULL UNIQUE
);

-- ── Core Patient Demographics ────────────────────────────────

CREATE TABLE patient (
    patient_id        INTEGER PRIMARY KEY,
    gender            TEXT    NOT NULL,
    age               REAL    NOT NULL,
    ever_married      TEXT    NOT NULL,
    work_type_id      INTEGER NOT NULL REFERENCES dim_work_type(work_type_id),
    residence_type_id INTEGER NOT NULL REFERENCES dim_residence_type(residence_type_id)
);

-- ── Patient Health / Clinical Data ──────────────────────────
-- Separated to avoid transitive dependency: bmi/glucose do NOT
-- functionally determine hypertension or stroke -- they are
-- independent clinical measurements for the same patient.

CREATE TABLE patient_health (
    patient_id        INTEGER PRIMARY KEY REFERENCES patient(patient_id),
    hypertension      INTEGER NOT NULL CHECK (hypertension IN (0, 1)),
    heart_disease     INTEGER NOT NULL CHECK (heart_disease IN (0, 1)),
    avg_glucose_level REAL,
    bmi               REAL,
    smoking_status_id INTEGER REFERENCES dim_smoking_status(smoking_status_id),
    stroke            INTEGER NOT NULL CHECK (stroke IN (0, 1))
);

-- ── Indexes for common query paths ──────────────────────────

CREATE INDEX idx_patient_age          ON patient(age);
CREATE INDEX idx_patient_work         ON patient(work_type_id);
CREATE INDEX idx_health_stroke        ON patient_health(stroke);
CREATE INDEX idx_health_hypertension  ON patient_health(hypertension);
CREATE INDEX idx_health_smoking       ON patient_health(smoking_status_id);
