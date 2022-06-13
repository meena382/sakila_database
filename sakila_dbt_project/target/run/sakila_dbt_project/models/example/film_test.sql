

  create  table "sakila_wh"."examples"."film_test__dbt_tmp"
  as (
    select
*
from
-- sakila_wh.stg.film
"sakila_wh"."stg"."film"
  );