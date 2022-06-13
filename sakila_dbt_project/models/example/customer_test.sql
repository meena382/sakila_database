{{ config(materialized='table',alias='customers_alias',schema='itamar') }}

select
*
from
{{ ref('hello_world') }}
where customer_id < {{ var('cust_id') }}
