
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_rental_info_model
    
    
    
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
        
        
            RENTAL_INFO:rental_date as rental_date
            ,
        
            RENTAL_INFO:return_date as return_date
            ,
        
            RENTAL_INFO:pickup_location as pickup_location
            ,
        
            RENTAL_INFO:drop_off_location as drop_off_location
            
        
    from demo_ask_db.demo_ask_schema.rental_model


)

select 
    *
from source_model
    )
;


  