# Dataset Profile Report

## Dataset Source
- **Platform**: Kaggle
- **Dataset**: Stroke Prediction Dataset
- **File**: healthcare-dataset-stroke-data.csv

## Dataset Owner
fedesoriano (Kaggle contributor)

## Number of Records
**5,110** patient records

## Number of Variables
**12** variables (11 features + 1 target)

## Variable Descriptions

| Variable | Type | Values | Description |
|----------|------|--------|-------------|
| id | Integer | Unique | Patient identifier |
| gender | Categorical | Male, Female, Other | Patient gender |
| age | Continuous | 0.08 – 82 | Age in years |
| hypertension | Binary | 0, 1 | 1 = has hypertension |
| heart_disease | Binary | 0, 1 | 1 = has heart disease |
| ever_married | Categorical | Yes, No | Marital status |
| work_type | Categorical | Private, Self-employed, Govt_job, children, Never_worked | Employment type |
| Residence_type | Categorical | Urban, Rural | Living area |
| avg_glucose_level | Continuous | 55.12 – 271.74 | Average blood glucose (mg/dL) |
| bmi | Continuous | 10.3 – 97.6 | Body mass index |
| smoking_status | Categorical | formerly smoked, never smoked, smokes, Unknown | Smoking history |
| stroke | Binary | 0, 1 | **Target**: 1 = had a stroke |

## Data Collection Process
Clinical patient data collected from multiple healthcare institutions. Each row represents one unique patient with their demographic characteristics, medical history, lifestyle attributes, and stroke outcome.

## Class Distribution (Target Variable)

| Outcome | Count | Percentage |
|---------|-------|-----------|
| No Stroke (0) | 4,861 | 95.13% |
| Stroke (1) | 249 | 4.87% |

**Note**: Dataset is heavily imbalanced — stroke cases represent only 4.87% of records.

## Missing Data Summary

| Variable | Missing | Action |
|----------|---------|--------|
| bmi | 201 (3.93%) | Stored as NULL in database |
| smoking_status | 1,544 "Unknown" | Retained as a separate category |
| All others | 0 | None required |
