-- reference here: https://support.google.com/analytics/answer/9216061?hl=en 
 
 with event_with_params as (
   select *,
      {{ unnest_key('event_params', 'entrances',  'int_value') }},
      {{ unnest_key('event_params', 'page_title') }},
      {{ unnest_key('event_params', 'page_referrer') }},
      {{ unnest_key('event_params', 'search_term') }}
 from {{ref('stg_ga4__events')}}
 where event_name = 'view_search_results'
)

select * from event_with_params