# Stroke Risk Factor Analysis

A comprehensive data analytics project examining clinical risk factors associated with stroke using a dataset of 5,110 patients.

## Repository Structure

```
Project
├── data/               Raw Kaggle CSV dataset
├── notebooks/          Jupyter analysis notebook
├── reports/            All phase deliverables (16 documents)
├── poster/             Conference research poster
├── paper/              Full research paper
├── presentation/       Poster presentation script
├── figures/            Generated visualizations
├── dashboard/          Power BI dashboard instructions
├── Dataset/            SQL scripts and SQLite database
└── README.md
```

## How to Run

### Option 2 — VS Code Terminal
1. Open VS Code terminal: **Ctrl + `**
2. Run:
```powershell
cd Dataset
.\run.ps1
```

### Option 3 — Full manual command
```powershell
cd "C:\Users\Al3xR\OneDrive\Desktop\Dataset\Dataset"
sqlite3 stroke.db ".read schema.sql"
& "C:\Users\Al3xR\.local\bin\python3.14.exe" load_data.py
$env:PYTHONIOENCODING="utf-8"
uv run --with pandas --with scipy --with matplotlib --with seaborn --with nbconvert --with jupyter jupyter nbconvert --to notebook --execute analysis.ipynb --output analysis_output.ipynb
```

Results are saved to `Dataset/analysis_output.ipynb`.

## Dataset
- **Source**: Kaggle — Stroke Prediction Dataset
- **Records**: 5,110 patients
- **Variables**: 12 (demographic, medical, lifestyle)
- **Target**: stroke (binary: 0 = no stroke, 1 = stroke)

## Research Questions
| # | Question | Method |
|---|----------|--------|
| RQ1 | Does age affect stroke risk? | T-Test |
| RQ2 | Does hypertension affect stroke risk? | Chi-Square |
| RQ3 | Does heart disease affect stroke risk? | Chi-Square |
| RQ4 | Do lifestyle factors affect stroke rates? | ANOVA |
| RQ5 | Does glucose level affect stroke risk? | T-Test + Quartiles |
| RQ6 | Does BMI affect stroke risk? | T-Test + Quartiles |
| RQ7 | Does residence type affect stroke rates? | Chi-Square |
| RQ8 | Does marital status relate to stroke risk? | Chi-Square |
| RQ9 | Is there a gender difference in stroke rates? | Chi-Square |
| RQ10 | Which patient groups are at highest combined risk? | Segmentation |

## Key Findings
- Stroke patients are on average **67 years old** vs 41 for non-stroke patients
- Hypertension increases stroke risk by **3x**
- High glucose (>140) patients have **2.8x** higher stroke rate
- High-risk patients (score >= 3) have an **18.24%** stroke rate vs 4.87% overall

## Team
[Alex Ruder & Taija] | [Institution] | June 2026
