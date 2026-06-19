# Data Quality Report

## 1. Missing Value Analysis

| Variable | Missing Count | Missing % | Action Taken |
|----------|-------------|-----------|-------------|
| bmi | 201 | 3.93% | Stored as NULL in SQLite |
| smoking_status | 1,544 "Unknown" | 30.2% | Kept as separate category |
| All other variables | 0 | 0% | No action needed |

## 2. Duplicate Analysis
- **Total records**: 5,110
- **Duplicate rows**: 0
- **Duplicate IDs**: 0
- **Result**: No duplicates found

## 3. Outlier Detection

| Variable | Min | Max | Mean | Std Dev | Outliers |
|----------|-----|-----|------|---------|---------|
| age | 0.08 | 82 | 43.2 | 22.6 | None (valid range) |
| avg_glucose_level | 55.12 | 271.74 | 106.1 | 45.3 | High glucose (>200): ~11% — clinically valid |
| bmi | 10.3 | 97.6 | 28.9 | 7.9 | BMI >60 flagged but retained (extreme obesity) |

## 4. Data Type Validation

| Variable | Expected Type | Actual Type | Valid? |
|----------|-------------|-------------|--------|
| id | Integer | Integer | Yes |
| gender | String | String | Yes |
| age | Float | Float | Yes |
| hypertension | Binary (0/1) | Integer | Yes |
| heart_disease | Binary (0/1) | Integer | Yes |
| ever_married | String (Yes/No) | String | Yes |
| work_type | String | String | Yes |
| Residence_type | String | String | Yes |
| avg_glucose_level | Float | Float | Yes |
| bmi | Float/NULL | Float/NULL | Yes |
| smoking_status | String | String | Yes |
| stroke | Binary (0/1) | Integer | Yes |

## 5. Data Quality Assessment

| Dimension | Rating | Notes |
|-----------|--------|-------|
| Completeness | 96% | BMI has 201 nulls |
| Consistency | High | No conflicting values |
| Accuracy | High | Clinical values within valid ranges |
| Uniqueness | High | No duplicate records |
| Validity | High | All values match expected domains |

**Overall Data Quality: GOOD — suitable for statistical analysis**
