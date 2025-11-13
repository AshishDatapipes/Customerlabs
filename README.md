# GA4 Attribution Dashboard – BigQuery + Looker Studio

This project demonstrates a modular attribution pipeline using GA4-style session data. It models first-click and last-click attribution in BigQuery and visualizes user journeys in Looker Studio.

## Stack
- BigQuery: SQL-based attribution modeling
- dbt (optional): Modular transformation logic
- Looker Studio: Interactive dashboard with filters and breakdowns
- GitHub: Version-controlled documentation and screenshots

## Attribution Logic
The model identifies:
- `first_click_source`: Earliest session source per user
- `last_click_source`: Most recent session source per user
- `user_pseudo_id`: Anonymized user identifier

SQL logic uses `MIN(session_start)` and `MAX(session_start)` to extract attribution points and joins them into a unified view.

## Dashboard Features
- Bar charts comparing first vs last click sources
- Time series of attribution trends
- Scorecards for total users and source-specific counts
- Filter controls for source, platform, and date range
- Clean field naming and modular layout

## Screenshots
Screenshots of SQL logic and dashboard layout are included in the `/screenshots` folder for reference.

## How to Use
1. Clone the repository
2. Deploy the SQL view in BigQuery
3. Connect the view to Looker Studio
4. Customize filters and charts as needed

## Purpose
This project is part of a technical portfolio designed to demonstrate:
- Modular orchestration and transformation logic
- Real-time troubleshooting across distributed systems
- Clear, review-ready presentation of data engineering workflows
