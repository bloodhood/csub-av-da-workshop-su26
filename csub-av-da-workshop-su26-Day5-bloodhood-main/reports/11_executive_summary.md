# Executive Summary

## Stroke Risk Factor Analysis — Healthcare Dataset
**Date**: June 2026 | **Team**: [Student Names] | **Institution**: [Institution]

---

## Purpose
This project analyzed a clinical dataset of 5,110 patients to identify the key factors associated with stroke risk and provide actionable recommendations for healthcare providers and public health decision-makers.

## Dataset
- **Source**: Kaggle Stroke Prediction Dataset
- **Size**: 5,110 patients, 12 variables
- **Overall stroke rate**: 4.87% (249 out of 5,110 patients)

## Key Findings

| Finding | Detail |
|---------|--------|
| Age is the #1 risk factor | Stroke patients avg 67.7 yrs vs 41.9 yrs (p < 0.0001) |
| Hypertension triples risk | 13.25% stroke rate vs 3.97% without (p < 0.0001) |
| High glucose doubles risk | 10.9% stroke rate in highest quartile vs 1.9% lowest |
| High-risk patients identifiable | Risk score >= 3: 18.24% stroke rate (3.7x average) |
| Self-employed highest by work type | 7.94% stroke rate vs 5.09% Private sector |

## Recommendations

### Immediate Actions
1. **Flag all patients 60+** with any comorbidity for stroke risk counselling
2. **Deploy 5-factor risk score** in EHR systems — zero additional cost
3. **Target hypertension management** as the single most impactful intervention

### Medium-Term Actions
4. **Glucose monitoring program** for patients with avg_glucose > 114 mg/dL
5. **Employer health partnerships** with private and self-employed sector workers

### Long-Term Actions
6. **Improve smoking data collection** — 30% unknown status limits predictive power
7. **Develop a stroke risk dashboard** for real-time population health monitoring

## Statistical Confidence
All significant findings were validated at the **95% confidence level (a = 0.05)**. Results replicated across multiple statistical methods (T-Test, ANOVA, Chi-Square, Quartile Analysis).

## Impact
Implementing the 5-factor risk scoring tool could identify the **433 highest-risk patients** (8.5% of population) who account for a disproportionate share of stroke cases, enabling targeted prevention that could reduce population stroke incidence by an estimated 20–30%.
