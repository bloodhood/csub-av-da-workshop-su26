# Statistical Validation Report

## Test Results Summary

### RQ1 — T-Test: Age vs Stroke
- **Stroke group mean age**: 67.7 years
- **No-stroke group mean age**: 41.9 years
- **T-statistic**: 22.94
- **P-value**: < 0.0001
- **Result**: SIGNIFICANT — Age is a strong predictor of stroke

### RQ2 — Chi-Square: Hypertension vs Stroke
- **Stroke rate (with hypertension)**: 13.25%
- **Stroke rate (without hypertension)**: 3.97%
- **Chi-Square**: 81.61
- **P-value**: 1.66e-19
- **Result**: SIGNIFICANT — Hypertension strongly associated with stroke

### RQ3 — Chi-Square: Heart Disease vs Stroke
- **Stroke rate (with heart disease)**: ~17%
- **Stroke rate (without heart disease)**: ~4%
- **Chi-Square**: ~60
- **P-value**: < 0.0001
- **Result**: SIGNIFICANT — Heart disease is a strong risk factor

### RQ4 — ANOVA: Work Type vs Stroke
- **Highest stroke rate**: Self-employed (7.94%)
- **Lowest stroke rate**: Never_worked (0.00%)
- **F-statistic**: 12.40
- **P-value**: 4.90e-10
- **Result**: SIGNIFICANT — Work type groups differ significantly

### RQ5 — T-Test: Glucose Level vs Stroke
- **Stroke group mean glucose**: 132.54 mg/dL
- **No-stroke group mean glucose**: 104.80 mg/dL
- **T-statistic**: 9.51
- **P-value**: 2.77e-21
- **Result**: SIGNIFICANT — Higher glucose strongly linked to stroke

### RQ6 — T-Test: BMI vs Stroke
- **Stroke group mean BMI**: 30.47
- **No-stroke group mean BMI**: 28.82
- **T-statistic**: 3.21
- **P-value**: 0.0014
- **Result**: SIGNIFICANT — BMI differs between groups

### RQ4b — Chi-Square: Smoking Status vs Stroke
- **Chi-Square**: 6.78
- **P-value**: 0.079
- **Result**: NOT SIGNIFICANT at a=0.05

### Confidence Intervals (95%) for Stroke Rate
| Group | Stroke Rate | 95% CI |
|-------|------------|--------|
| Overall | 4.87% | [4.29%, 5.45%] |
| Senior (>60) | 13.57% | [11.69%, 15.45%] |
| Hypertension | 13.25% | [10.21%, 16.29%] |
| High glucose (Q4) | 10.9% | [8.87%, 12.93%] |
