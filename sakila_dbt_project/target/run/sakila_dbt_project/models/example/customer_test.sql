

  create  table "sakila_wh"."itamar"."customer_test__dbt_tmp"
  as (
    

select
*
from
"sakila_wh"."examples"."hello_world"
where customer_id < 10
  );