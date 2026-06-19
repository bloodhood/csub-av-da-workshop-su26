-- verify.sql — Step 2: Check all data loaded correctly

-- 1. Total record count (expected: 5110)
SELECT COUNT(*) AS total_patients FROM patient;

-- 2. Table row counts
SELECT 'patient'           AS tbl, COUNT(*) AS rows FROM patient
UNION ALL
SELECT 'patient_health',            COUNT(*)         FROM patient_health
UNION ALL
SELECT 'dim_work_type',             COUNT(*)         FROM dim_work_type
UNION ALL
SELECT 'dim_residence_type',        COUNT(*)         FROM dim_residence_type
UNION ALL
SELECT 'dim_smoking_status',        COUNT(*)         FROM dim_smoking_status;

-- 3. Sample rows
SELECT
    p.patient_id, p.gender, p.age,
    wt.work_type_name      AS work_type,
    rt.residence_type_name AS residence,
    ph.hypertension, ph.heart_disease,
    ph.avg_glucose_level, ph.bmi,
    ss.smoking_status_name AS smoking_status,
    ph.stroke
FROM patient p
JOIN patient_health       ph ON p.patient_id       = ph.patient_id
JOIN dim_work_type        wt ON p.work_type_id      = wt.work_type_id
JOIN dim_residence_type   rt ON p.residence_type_id = rt.residence_type_id
LEFT JOIN dim_smoking_status ss ON ph.smoking_status_id = ss.smoking_status_id
LIMIT 10;

-- 4. Missing data check
SELECT
    SUM(CASE WHEN ph.bmi IS NULL THEN 1 ELSE 0 END) AS missing_bmi,
    SUM(CASE WHEN ph.avg_glucose_level IS NULL THEN 1 ELSE 0 END) AS missing_glucose
FROM patient_health ph;

-- 5. Stroke split
SELECT stroke, COUNT(*) AS patients,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM patient_health), 2) AS pct
FROM patient_health GROUP BY stroke;
