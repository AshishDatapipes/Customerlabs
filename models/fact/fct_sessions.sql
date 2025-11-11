{{ config(materialized="table", tags=["ga4", "fact"]) }}

with session_metrics as (
    select
        user_pseudo_id,
        session_id,
        min(event_ts) as session_start,
        max(event_ts) as session_end,
        timestamp_diff(max(event_ts), min(event_ts), second) as session_duration_sec,
        count(*) as event_count,
        array_agg(distinct event_name) as event_types,
        platform,
        traffic_source,
        traffic_medium,
        device_category,
        operating_system,
        country,
        region
    from {{ ref('int_sessions') }}
    group by
        user_pseudo_id,
        session_id,
        platform,
        traffic_source,
        traffic_medium,
        device_category,
        operating_system,
        country,
        region
)

select * from session_metrics
