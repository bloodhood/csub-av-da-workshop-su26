# Stroke Risk Factor Analysis: A Statistical Study of Clinical Predictors

Authors Alex Ruder, Taija Grace

Institution Kyu Lee

Date: June 2026

## ABSTRACT

**Background and Motivation.**
Stroke is one of the most devastating neurological emergencies worldwide and a leading driver of death and permanent disability across every region of the globe. Medically, a stroke occurs when blood supply to a portion of the brain is suddenly interrupted — either because an artery is blocked (ischemic stroke, approximately 87% of all cases) or because a blood vessel ruptures and bleeds into brain tissue (hemorrhagic stroke, approximately 13%). In either case, brain cells begin dying within minutes, and the resulting damage to motor, cognitive, or speech function is frequently irreversible. Each year, approximately 15 million people suffer a stroke worldwide: 6.2 million die and another 5 million are left permanently disabled — making stroke the second leading cause of death and the single largest cause of long-term adult disability globally [7]. In the United States alone, a stroke occurs every 40 seconds, producing roughly 795,000 events per year and an economic burden exceeding $34 billion in direct medical costs and lost productivity [6]. Despite this enormous burden, clinical evidence consistently shows that up to 80% of strokes are preventable if high-risk individuals are identified early and their modifiable risk factors — including hypertension, hyperglycemia, atrial fibrillation, smoking, obesity, and physical inactivity — are addressed through timely medical intervention [2].

**The Problem.**
The central challenge is that routine primary care visits already collect the data needed to identify these high-risk individuals — patient age, blood pressure readings, glucose levels, BMI, cardiovascular history, and lifestyle information are all recorded in standard clinical encounters — yet this data is rarely used in a structured, evidence-based risk stratification process. Without a systematic method for translating raw clinical measurements into an actionable risk signal, many patients who are on a trajectory toward stroke remain undetected until the event itself occurs. Existing stroke prediction models, while achieving high accuracy using machine learning techniques, are often too computationally complex and too difficult for a clinician to explain to a patient or audit for bias, limiting their real-world adoption in clinical practice.

**Approach.**
This study addresses this gap by applying transparent, hypothesis-driven statistical data analytics to a real-world clinical stroke dataset of 5,110 patients. Rather than optimizing a black-box predictive model, we systematically test whether known stroke risk factors are statistically detectable and measurable within this dataset using methods a clinician can directly interpret. Specifically, we apply: (1) Independent Samples T-Tests to compare continuous variable means — such as age and glucose level — between patients who had a stroke and those who did not; (2) Chi-Square Tests of Independence to measure whether categorical factors like hypertension and heart disease are significantly associated with stroke outcome; (3) One-Way ANOVA to compare stroke rates across multiple subgroups simultaneously, such as occupational categories; (4) Quartile Analysis to detect dose-response relationships by dividing continuous variables into four ranked groups and tracking stroke rates across the gradient; and (5) Patient Segmentation to group patients by multiple simultaneous risk attributes and identify the highest-concentration subpopulations.


## 1. Introduction
Stroke is the second leading cause of death globally, claiming approximately 6.2 million lives annually. In the United States, 795,000 strokes occur each year, with an economic burden exceeding $34 billion. The clinical consensus is that up to 80% of strokes are preventable through lifestyle modification and medical management of risk factors.

Despite this, many high-risk individuals remain unidentified until a stroke event occurs. Routine clinical visits collect extensive patient data — including age, blood pressure, glucose levels, BMI, and lifestyle history — yet this data is rarely used in a systematic, evidence-based risk stratification process.

This research applies statistical data analytics to a clinical stroke dataset to identify which factors most strongly predict stroke, quantify their effect sizes, and propose a simple risk stratification tool for clinical deployment.

---

## 2. Literature Review
Prior research consistently identifies age, hypertension, diabetes (elevated glucose), and cardiovascular disease as primary stroke risk factors (Feigin et al., 2016). The INTERSTROKE study found that five modifiable risk factors — hypertension, physical inactivity, diabetes, diet, and smoking — account for over 80% of global stroke burden.

Machine learning approaches have demonstrated accuracy above 90% in stroke prediction (Dritsas & Trigka, 2022), but complex models lack clinical interpretability. Simpler statistical models and risk scores (e.g., Framingham Stroke Risk Score) have proven more adoptable in clinical practice.

This study bridges the gap by applying transparent statistical methods to derive interpretable findings directly applicable to clinical decision-making.

---

## 3. Dataset Description
The dataset is sourced from Kaggle (fedesoriano, 2021) and contains 5,110 patient records with 12 attributes:

- **Demographic**: id, gender, age, ever_married
- **Medical**: hypertension, heart_disease, avg_glucose_level, bmi
- **Lifestyle**: work_type, Residence_type, smoking_status
- **Target**: stroke (binary: 0 = no stroke, 1 = stroke)

The dataset exhibits significant class imbalance: 4,861 non-stroke cases (95.13%) and 249 stroke cases (4.87%). Missing data was limited to BMI (201 nulls, 3.93%) and smoking status (1,544 "Unknown", 30.2%).

---

## 4. Methodology

### 4.1 Database Design
Data was normalized into a 3NF SQLite schema with five tables: patient, patient_health, dim_work_type, dim_residence_type, and dim_smoking_status. This eliminated data redundancy and enabled efficient query-based analysis.

### 4.2 Data Cleaning
Missing BMI values were stored as NULL. Smoking status "Unknown" was retained as a distinct category. Outliers in glucose (>200 mg/dL) and BMI (>60) were validated as clinically plausible and retained.

### 4.3 Descriptive Statistics
Mean, median, mode, standard deviation, variance, and quartiles were computed for all continuous variables. Frequency distributions were tabulated for all categorical variables.

### 4.4 Hypothesis Testing
Ten research questions were formulated with null and alternative hypotheses. Tests applied:
- **Independent Samples T-Test**: comparing continuous means between stroke/non-stroke groups
- **One-Way ANOVA**: comparing stroke rates across 3+ categorical groups
- **Chi-Square Test of Independence**: testing association between categorical variables and stroke
- **Quartile Analysis**: dividing continuous variables into Q1–Q4 bins and comparing stroke rates

Significance level: **a = 0.05** (95% confidence).

### 4.5 Patient Segmentation
A 5-factor composite risk score (0–5) was constructed from binary indicators: hypertension, heart disease, glucose > 140, age > 60, and smoking (formerly or currently). Patients were segmented by score and age group.

---

## 5. Results

### 5.1 Descriptive Statistics
The mean patient age was 43.2 years (SD = 22.6). Mean glucose was 106.2 mg/dL (SD = 45.3). Mean BMI was 28.9 (SD = 7.9). Females represented 58.6% of the dataset; 9.7% had hypertension; 5.4% had heart disease.

### 5.2 RQ1 — Age and Stroke Risk
Stroke patients had a mean age of 67.7 years vs 41.9 years for non-stroke patients. The independent T-Test yielded T = 22.94, p < 0.0001 — highly significant. Senior patients (>60) had a 13.57% stroke rate vs 0.13% for patients under 30.

### 5.3 RQ2 — Hypertension and Stroke Risk
Chi-Square analysis: Chi2 = 81.61, p = 1.66e-19. Patients with hypertension had a stroke rate of 13.25% vs 3.97% without — a 3.3x increase.

### 5.4 RQ3 — Heart Disease and Stroke Risk
Chi-Square analysis: Chi2 = 60.22, p < 0.0001. Patients with heart disease had approximately 4x higher stroke rates than those without.

### 5.5 RQ4 — Lifestyle Factors
Work type showed significant ANOVA results (F = 12.40, p = 4.90e-10). Self-employed patients had the highest stroke rate (7.94%). Smoking status showed borderline significance (p = 0.079), likely attenuated by 30% missing values.

### 5.6 RQ5 — Glucose Level and Stroke Risk
T-Test: T = 9.51, p = 2.77e-21. Stroke group mean glucose was 132.5 vs 104.8 mg/dL. Quartile analysis confirmed a monotonic increase in stroke rate from Q1 (1.9%) to Q4 (10.9%).

### 5.7 RQ6 — BMI and Stroke Risk
T-Test: T = 3.21, p = 0.0014. Stroke group mean BMI was 30.47 vs 28.82. BMI quartile analysis showed a non-linear pattern — Q3 had the highest stroke rate (5.59%), not Q4.

### 5.8 Patient Segmentation
High-risk patients (risk score >= 3) represented 8.5% of the population but had an 18.24% stroke rate — 3.7x the population average. Senior patients with hypertension and high glucose had estimated stroke rates of ~28%.

---

## 6. Discussion
Findings are consistent with established clinical literature. Age and hypertension emerge as the dominant predictors, confirming Feigin et al.'s framework. The glucose relationship confirms the diabetes-stroke link documented in prior studies.

The novel contribution of this study is the 5-factor risk score, which operationalizes multiple predictors into a single actionable metric. With a positive predictive value of 18.24% in the high-risk group, this score could serve as a first-line triage tool in primary care settings.

The non-significance of smoking may reflect data quality limitations (30% Unknown) rather than a true lack of association. Future studies with complete smoking data would likely show significance.

---

## 7. Threats to Validity

| Threat | Description | Mitigation |
|--------|-------------|-----------|
| Class Imbalance | 95% no-stroke vs 5% stroke | Reported rates; did not train ML |
| Missing BMI | 201 nulls (3.93%) | Excluded from BMI analysis only |
| Unknown Smoking | 1,544 (30.2%) | Retained as category; flagged as limitation |
| Cross-sectional Data | Single time-point; no causality | Described as associations only |
| Dataset Source | Kaggle — unverified clinical source | Findings treated as exploratory |

---

## 8. Conclusion
This study confirms that stroke risk is statistically predictable from routinely collected clinical data. Age, hypertension, heart disease, and glucose level are the strongest predictors, all achieving p < 0.0001. A simple 5-factor risk score identifies the highest-risk 8.5% of patients, who have a stroke rate nearly 4x the population average.

These findings support immediate implementation of risk-based screening protocols in primary care, with particular focus on patients over 60 with comorbidities.

---

## 9. Future Work
- Apply ML (Logistic Regression, Random Forest, XGBoost) for improved prediction
- Address class imbalance with SMOTE or weighted classifiers
- Validate on prospective cohort data
- Build real-time clinical dashboard integrated with EHR systems
- Investigate socioeconomic determinants as additional risk predictors

---

## References
- Feigin, V. L., et al. (2016). Global burden of stroke. *Lancet Neurology*, 15(9), 913-924.
- Dritsas, E., & Trigka, M. (2022). Stroke risk prediction with machine learning techniques. *Sensors*, 22(13), 4670.
- fedesoriano. (2021). Stroke Prediction Dataset. Kaggle. https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset
- American Stroke Association. (2024). Stroke statistics. https://www.stroke.org
