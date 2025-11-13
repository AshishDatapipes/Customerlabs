# GA4 Attribution Dashboard – BigQuery + Looker Studio

This project demonstrates a modular, real-time attribution pipeline using GA4-style session data. It models first-click and last-click attribution in BigQuery, visualizes user journeys in Looker Studio, and showcases orchestration clarity for recruiter visibility.

## Stack
- BigQuery: SQL-based attribution modeling
- dbt: Modular transformation logic (optional)
- Looker Studio: Interactive dashboard with filters and breakdowns
- GitHub: Version-controlled portfolio with screenshots and documentation

## Attribution Logic
The core model identifies:
- `first_click_source`: Earliest session source per user
- `last_click_source`: Most recent session source per user
- `user_pseudo_id`: Anonymized user identifier

SQL logic uses `MIN(session_start)` and `MAX(session_start)` to extract attribution points and joins them into a unified view.

## Dashboard Features
- Bar charts comparing first vs last click sources
- Time series of attribution trends
- Scorecards for total users and source-specific counts
- Filter controls for source, platform, and date range
- Clean field naming and recruiter-friendly layout

## Screenshots
Screenshots of SQL logic and dashboard layout included in `/screenshots` folder for documentation and portfolio use.

## How to Use
1. Clone the repo
2. Deploy SQL view in BigQuery
3. Connect to Looker Studio
4. Customize filters and charts as needed

## Purpose
This project is part of a technical portfolio designed to demonstrate:
- Modular orchestration mindset
- Real-time troubleshooting across distributed systems
- Recruiter-ready presentation of data engineering skills

Built with clarity, modularity, and impact in mind.
