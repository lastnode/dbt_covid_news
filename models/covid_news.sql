  select 
    format_date("%Y-%m-%d", DATE (parse_timestamp('%Y%m%d%H%M%S', cast(dateadded as string)))) as date, 
    sum (case when sourceurl like "%covid%" then 1 else 0 end) as term_covid_count,
    sum (case when sourceurl like "%coronavirus%" then 1 else 0 end) as term_coronavirus_count,
  from gdelt-bq.gdeltv2.events
  
  group by date
  order by date