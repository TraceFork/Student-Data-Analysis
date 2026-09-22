# Student Data Analysis

A small R project for analyzing student data using summary statistics, distributions, and visualizations.

## Overview

This repository explores a student dataset to:
- inspect the structure and quality of the data
- calculate descriptive statistics
- analyze distributions and category counts
- create visual summaries and charts
- document the workflow in a reproducible, easy-to-follow format

## Repository Structure

```text
Student-Data-Analysis/
├── README.md
├── .gitignore
├── DATA/                  # optional future dataset folder
├── scripts/
│   └── student_analysis.R
├── docs/
│   ├── student_analysis.Rmd
│   └── student_analysis.html
├── outputs/
│   └── plots/
├── archive/
│   └── legacy/
│       ├── Markdown(MIhir-078(bca(reg))).rmd
│       ├── Markdown-MIhir-078-bca-reg---.html
│       └── tutorial_readme.md
└── data/
    └── students.csv
```

## Current Data

- Dataset: `data/students.csv`
- Description: Student information including ID, name, gender, date of birth, course, department, and CGPA.

## Main Analysis

The project analyzes:
- student CGPA summary statistics
- gender distribution
- course distribution
- CGPA distribution
- average CGPA by course

## Documentation

The main documentation is organized as:
- `README.md` — project overview and usage
- `docs/student_analysis.Rmd` — R Markdown report source
- `docs/student_analysis.html` — rendered HTML report
- `archive/legacy/` — older exploratory files kept for reference

## Requirements

This project uses R and the following package:
- `knitr` (optional but useful for rendering reports)

## How to Run

Open the project in RStudio or another R environment and run:

```r
source("scripts/student_analysis.R")
```

If you want to render the report manually:

```r
rmarkdown::render("docs/student_analysis.Rmd")
```

## Contributor

- TraceFork
- Mihir H. Rathod

## Notes

This repository is structured as a clean and maintainable R analysis project. The source code, datasets, documentation, and generated outputs are separated so the project remains easy to understand, extend, and share.
