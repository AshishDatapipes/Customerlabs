{{ config(materialized="table", tags=["ga4", "intermediate"]) }}

with base_events as (
    select
        user_pseudo_id,
        timestamp_micros(event_timestamp) as event_ts,
        event_name,
        platform,
        traffic_source,
        traffic_medium,
        device_category,
        operating_system,
        country,
        region
    from {{ ref('stg_ga4_events') }}
),

sessionized as (
    select
        *,
        timestamp_diff(
            event_ts,
            lag(event_ts) over (partition by user_pseudo_id order by event_ts),
            minute
        ) as minutes_since_last_event,

        case
            when timestamp_diff(
                event_ts,
                lag(event_ts) over (partition by user_pseudo_id order by event_ts),
                minute
            ) > 30 or
            lag(event_ts) over (partition by user_pseudo_id order by event_ts) is null
            then 1
            else 0
        end as is_new_session
    from base_events
),

final as (
    select
        *,
        sum(is_new_session) over (partition by user_pseudo_id order by event_ts) as session_id
    from sessionized
)

select * from final
