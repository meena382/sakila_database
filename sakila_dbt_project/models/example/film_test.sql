
select
*
from
-- sakila_wh.stg.film
{{ source('stg_example', 'film') }}
