
      

  create  table "sakila_wh"."dwh"."fact_payment"
  as (
    

select
*,
'2022-06-13 04:36:37' as dbt_time
from
"sakila_wh"."stg"."payment"
where 1=1


  );
  