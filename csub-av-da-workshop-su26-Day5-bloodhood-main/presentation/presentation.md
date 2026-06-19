# Poster Presentation Script
## 10-Minute Presentation Guide

---

### Slide 1 — Introduction (1 min)
"Good [morning/afternoon]. My name is [Name] and today I'm presenting our research on stroke risk factor analysis. Stroke is the second leading cause of death globally, and up to 80% of strokes are preventable. Our goal was to use a clinical dataset of 5,110 patients to identify which factors most strongly predict stroke risk — and use those findings to recommend actionable interventions."

---

### Slide 2 — Dataset (1 min)
"We used the Kaggle Stroke Prediction Dataset — 5,110 patient records with 12 variables covering demographics, medical history, and lifestyle factors. The overall stroke rate in this dataset is 4.87%, which reflects the real-world population rate. We normalized this data into a 3NF SQLite database and loaded it into Python for analysis."

---

### Slide 3 — Research Questions (1 min)
"We developed 10 research questions covering age, hypertension, heart disease, lifestyle factors, glucose, BMI, residence type, marital status, gender, and patient segmentation. I'll focus today on the five most significant findings."

---

### Slide 4 — Methodology (1 min)
"Our methodology followed a four-phase pipeline: data cleaning and profiling, exploratory analysis with visualizations, statistical hypothesis testing using T-Tests, ANOVA, Chi-Square and Quartiles, and finally patient segmentation using a composite risk score."

---

### Slide 5 — Finding 1: Age (2 min)
"Our most striking finding — [point to boxplot] — stroke patients are on average 26 years OLDER than non-stroke patients. 67.7 years vs 41.9 years. The T-Test gives us a p-value below 0.0001, which is astronomically significant. Senior patients over 60 account for 71% of all strokes despite being only 25% of our patient population."

---

### Slide 6 — Finding 2: Hypertension & Glucose (2 min)
"Hypertension triples stroke risk — 13.25% vs 3.97%. [point to bar chart] Heart disease quadruples it. These are both statistically significant with Chi-Square p-values below 0.0001. Similarly, patients in the highest glucose quartile — those with average glucose above 114 — have a stroke rate nearly 6 times higher than the lowest quartile."

---

### Slide 7 — Patient Segmentation (1 min)
"We built a 5-factor risk score. Patients scoring 3 or higher — those with a combination of age, hypertension, heart disease, high glucose, and smoking history — have an 18.24% stroke rate. That's 3.7 times the population average. This simple score, with no additional testing, could be implemented in any electronic health record system today."

---

### Slide 8 — Recommendations & Future Work (1 min)
"Based on our findings, we recommend implementing this risk score in EHR systems, launching annual screening for all patients over 60 with any comorbidity, and setting a glucose alert threshold at 114 mg/dL. For future work, we plan to apply machine learning to improve prediction accuracy and address the class imbalance in the dataset."

---

### Q&A Preparation

**Q: Why is the dataset imbalanced?**
A: Only 4.87% of patients had strokes, reflecting real-world population rates. We retained this imbalance but it's a limitation — future work would use SMOTE to balance classes for ML modelling.

**Q: Why did smoking show no significance?**
A: 30% of smoking status values are "Unknown." This missing data likely masks the true relationship. With complete data we would expect significance.

**Q: How reliable is the risk score?**
A: It correctly identifies the high-risk group with a 18.24% stroke rate vs 4.87% overall. However, it needs clinical validation on a prospective cohort before clinical deployment.
