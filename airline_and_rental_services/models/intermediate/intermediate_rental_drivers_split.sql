with source_data as (select
    _id,
    array_size(DRIVERS) as num_drivers
from {{ref("rental_model")}} )

select 
    * 
from source_data

natural join ( select _ID,DRIVERS from {{ref("rental_model")}}) as origin_data