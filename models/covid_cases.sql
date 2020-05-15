  select 
    cast(date as string) as date,
    sum(confirmed) as confirmed_count,
    sum(recovered) as recovered_count,
    sum(deaths) as death_count
  from bigquery-public-data.covid19_jhu_csse.summary

  group by date  