{{ config(materialized="table", tags=["ga4", "attribution"]) }}

with sessions as (
    select * from {{ ref('fct_sessions') }}
),

first_click as (
    select
        user_pseudo_id,
        min(session_start) as first_click_time
    from sessions
    group by user_pseudo_id
),

final as (
    select
        fc.user_pseudo_id,
        fc.first_click_time,
        s.traffic_source,
        s.traffic_medium,
        s.device_category,
        s.country,
        s.region
    from first_click fc
    join sessions s
    on fc.user_pseudo_id = s.user_pseudo_id
    and fc.first_click_time = s.session_start
)

select * from final
