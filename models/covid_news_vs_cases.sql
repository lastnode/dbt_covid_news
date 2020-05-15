with covid_news as (

    select * from {{ ref('covid_news') }}

),

covid_cases as (

    select * from {{ ref('covid_cases') }}

)

select 
  covid_news.date,
  covid_news.term_covid_count,
  covid_news.term_coronavirus_count,
  covid_cases.confirmed_count,
  covid_cases.recovered_count,
  covid_cases.death_count
from covid_news

inner join covid_cases on covid_news.date = covid_cases.date

group by date, confirmed_count, recovered_count, death_count, term_covid_count, term_coronavirus_count

order by date desc


