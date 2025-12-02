
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_drivers_split
    
    
    
    as (with source_data as (select
    _id,
    array_size(DRIVERS) as num_drivers
from demo_ask_db.demo_ask_schema.rental_model )

select 
    * 
from source_data

natural join ( select _ID,DRIVERS from demo_ask_db.demo_ask_schema.rental_model) as origin_data
    )
;


  