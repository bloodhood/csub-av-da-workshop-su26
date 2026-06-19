# Segmentation Report

## Segmentation Approach
Patients were segmented using two methods:
1. **Age Group Segmentation** — Young (<30), Middle-aged (30–60), Senior (>60)
2. **Risk Score Segmentation** — composite score (0–5) based on clinical risk factors

## Risk Score Formula
Each patient receives 1 point per factor:
- Hypertension = 1
- Heart Disease = 1
- Avg Glucose Level > 140 = 1
- Age > 60 = 1
- Smoking status = "formerly smoked" or "smokes" = 1

**Maximum risk score = 5**

## Age Group Segmentation Results

| Age Group | Patients | Stroke Cases | Stroke Rate | Avg Risk Score |
|-----------|----------|-------------|-------------|----------------|
| Senior (>60) | 1,304 | 177 | 13.57% | 2.09 |
| Middle-aged (30–60) | 2,291 | 70 | 3.06% | 0.67 |
| Young (<30) | 1,515 | 2 | 0.13% | 0.22 |

## Risk Score Segmentation Results

| Risk Score | Patients | Stroke Rate |
|-----------|----------|------------|
| 0 | 2,847 | 1.37% |
| 1 | 1,481 | 5.47% |
| 2 | 349 | 12.03% |
| 3 | 216 | 17.59% |
| 4 | 176 | 19.89% |
| 5 | 41 | 21.95% |

## High-Risk Patient Profile (Score >= 3)
- **Total high-risk patients**: 433
- **Stroke rate in this group**: 18.24%
- **vs. overall stroke rate**: 4.87%
- **Risk multiplier**: 3.7x higher than average

## Highest Risk Combination
Senior patients (>60) with hypertension AND high glucose (>140):
- Stroke rate: ~28%
- Represents the most critical intervention target

## Recommendations from Segmentation
1. All patients aged >60 should be flagged for annual stroke screening
2. High-risk score patients (>=3) require immediate clinical follow-up
3. Hypertension management programs should target the senior segment
