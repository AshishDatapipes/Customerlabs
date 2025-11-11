{{ config(materialized="table", tags=["ga4", "staging"]) }}
select
    event_bundle_sequence_id,
    event_name,
    event_timestamp,
    user_pseudo_id,
    geo.country as country,
    geo.region as region,
    traffic_source.source as traffic_source,
    traffic_source.medium as traffic_medium,
    device.category as device_category,
    device.operating_system as operating_system,
    platform,
    event_params
from (select * from `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`)
