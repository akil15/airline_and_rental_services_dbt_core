
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.rental_model
    
    
    
    as (select
    _ID,
    CAR_TYPE, 
    DRIVERS, 
    EMAIL, 
    FIRST_NAME,
    LAST_NAME, 
    LICENSE_PLATE, 
    OPTIONS, 
    PRICE_USD, 
    RENTAL_ID, 
    RENTAL_INFO
from 
    demo_ask_db.rental.cars
    )
;


  