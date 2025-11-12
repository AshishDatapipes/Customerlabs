{{ config(materialized="table", tags=["ga4", "attribution"]) }}

with sessions as (
    select * from {{ ref('fct_sessions') }}
),

last_click as (
    select
        user_pseudo_id,
        max(session_start) as last_click_time
    from sessions
    group by user_pseudo_id
),

final as (
    select
        lc.user_pseudo_id,
        lc.last_click_time,
        s.traffic_source,
        s.traffic_medium,
        s.device_category,
        s.country,
        s.region
    from last_click lc
    join sessions s
      on lc.user_pseudo_id = s.user_pseudo_id
     and lc.last_click_time = s.session_start
)

select * from final
