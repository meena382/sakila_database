-- Use the `ref` function to select from other models

select *
from "sakila_wh"."examples"."my_first_dbt_model"
where id = 1