
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_options_model
    
    
    
    as (with source_model as (
    

    

    

    
        
    

    select
        
            _ID,
        
            RENTAL_ID,
        
            PRICE_USD,
        
            LICENSE_PLATE,
        
            LAST_NAME,
        
            FIRST_NAME,
        
            EMAIL,
        
            CAR_TYPE,
        
        
            OPTIONS:extra_driver as extra_driver
            ,
        
            OPTIONS:gps as gps
            ,
        
            OPTIONS:child_seat as child_seat
            ,
        
            OPTIONS:insurance as insurance
            
        
    from demo_ask_db.demo_ask_schema.rental_model


)

select 
    *
from source_model
    )
;


  