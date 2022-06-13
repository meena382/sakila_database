
      

  create  table "sakila_wh"."examples"."payment_inc"
  as (
    

select
*,
'2022-06-13 04:36:37' as dbt_time
from
stg.payment
where 1=1




-- - INTERVAL '3 DAY'
-- unique_key='payment_id'
  );
  