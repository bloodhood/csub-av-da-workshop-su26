# Dashboard Development Guide
## Power BI Dashboard — Stroke Risk Analysis

### Data Source
Connect Power BI to: `Dataset/stroke.db` (SQLite)

Use the ODBC SQLite driver or export to CSV first:
```powershell
cd "C:\Users\Al3xR\OneDrive\Desktop\Dataset\Dataset"
sqlite3 -csv stroke.db "SELECT p.patient_id, p.gender, p.age, p.ever_married, wt.work_type_name AS work_type, rt.residence_type_name AS residence_type, ph.hypertension, ph.heart_disease, ph.avg_glucose_level, ph.bmi, ss.smoking_status_name AS smoking_status, ph.stroke FROM patient p JOIN patient_health ph ON p.patient_id=ph.patient_id JOIN dim_work_type wt ON p.work_type_id=wt.work_type_id JOIN dim_residence_type rt ON p.residence_type_id=rt.residence_type_id LEFT JOIN dim_smoking_status ss ON ph.smoking_status_id=ss.smoking_status_id;" > dashboard_data.csv
```

### Dashboard Pages

#### Page 1 — Retention Dashboard (Overview)
- KPI Cards: Total Patients, Stroke Count, Overall Stroke Rate %
- Donut Chart: Stroke vs No Stroke split
- Bar Chart: Stroke rate by Age Group (Young / Middle-aged / Senior)
- Line Chart: Stroke rate trend by age (continuous)

#### Page 2 — Department Analysis (Work Type)
- Bar Chart: Stroke rate by Work Type (sorted descending)
- Table: Work Type | Total Patients | Stroke Cases | Stroke Rate %
- Slicer: Filter by Gender, Residence Type

#### Page 3 — Risk Factor Deep Dive
- Grouped Bar Chart: Stroke rate by Hypertension (Yes/No)
- Grouped Bar Chart: Stroke rate by Heart Disease (Yes/No)
- Scatter Plot: Age vs Glucose Level (colored by Stroke)
- Box Plot: Glucose Level by Stroke Outcome

#### Page 4 — Patient Segmentation
- Matrix: Risk Score (0-5) vs Stroke Rate
- Bar Chart: Age Group vs Stroke Rate
- KPI: High-Risk Patients Count (Score >= 3)
- KPI: High-Risk Stroke Rate vs Overall Rate

### Power BI Steps
1. Open Power BI Desktop
2. Get Data > Text/CSV > select `dashboard_data.csv`
3. Transform Data: set column types (age=Decimal, stroke=Whole Number, etc.)
4. Create calculated column: `RiskScore = [hypertension] + [heart_disease] + IF([avg_glucose_level]>140,1,0) + IF([age]>60,1,0) + IF([smoking_status]="formerly smoked" || [smoking_status]="smokes",1,0)`
5. Create calculated column: `AgeGroup = IF([age]<30,"Young",IF([age]<=60,"Middle-aged","Senior"))`
6. Build visuals per page structure above
7. Add slicers for Gender, Work Type, Residence Type
