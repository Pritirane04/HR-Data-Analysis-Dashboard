# HR-Data-Analysis-Dashboard

# 📊 HR Data Analytics & Employee Attrition Project

## 📝 Project Overview
This repository showcases an end-to-end data analytics project focused on Human Resources (HR) and workforce dynamics. By evaluating a substantial dataset of **17,000 employee records**, this project aims to uncover critical factors driving employee attrition, assess overall job satisfaction, and provide data-backed insights to improve organizational retention strategies.

## 📊 Dataset Used
- [hr_analysis.csv](https://github.com/Pritirane04/HR-Data-Analysis-Dashboard/blob/main/hr_analysis.csv)

## 🖼️ Dashboard Preview
Here is a preview of the completed interactive Power BI dashboard:

![HR Dashboard Preview 1](Screenshots/Screenshot%202026-06-16%20145634.png)

![HR Dashboard Preview 2](Screenshots/Screenshot%202026-06-16%20145850.png)


## 🚀 Key Dashboard Metrics & Features
The Power BI dashboard delivers precise, high-level business indicators at a single glance:

* **Executive KPIs:** Monitors a massive workforce size of 17,000 total employees, an Average Salary baseline of 6,492.39, Average Age of 36.95 years, and an Average Job Satisfaction rating of 2.75/4.
* **Attrition Drivers:** Explicitly tracks correlations such as OverTime hours vs. Attrition rates (showing a high 64.8% trend among specific overtime metrics).
* **Workforce Demographics:** Provides a departmental breakdown highlighting that *Research & Development* and *Sales* hold the highest employee counts compared to Human Resources.
* **Work-Life Balance Variance:** Includes an advanced waterfall visualization showing employee numbers mapped against work-life balance tiers (rated 0 to 6).
* **Interactive Slicers:** Features a dynamic filter panel on the left side (filtering by OverTime, Department, Job Role, and Attrition) for deep-dive analysis.



## 🛠️ Repository Structure & Tech Stack
This project integrates multiple data analytics tools to achieve its results:

1. **Data Cleaning (`Untitled.ipynb`):** Python-based data preprocessing using Pandas to handle null entries and eliminate duplicate records.
2. **Database Analysis (`hr data analysis.sql`):** SQL queries written in MySQL Workbench to aggregate core metrics and prepare calculated segments.
3. **Data Visualization (`hr dashboard.pbix`):** Interactive dashboarding in Power BI Desktop utilizing structured DAX measures and cohesive color palettes.
4. **Dataset (`hr_analysis.csv`):** The primary data source housing the 17K employee records.



## 💡 Key Business Insights (From the Dashboard)
* **Overtime Impact:** Employees who consistently put in Overtime hours demonstrate a significantly higher propensity for attrition compared to non-overtime staff.
* **Departmental Concentration:** The *Research & Development* and *Sales* business units require the closest retention monitoring as they represent the majority of the organizational headcount.
* **Satisfaction Core:** Job satisfaction and work-life balance ratings directly influence the metric patterns, suggesting that soft-benefits are key to keeping retention stable.
