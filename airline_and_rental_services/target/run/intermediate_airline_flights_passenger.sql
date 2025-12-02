
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.intermediate_airline_flights_passenger
    
    
    
    as (with source_model as (
    

    

    

    
        
    

    select
        
            _ID,
        
            ORIGIN,
        
            DESTINATION,
        
            AGENT_FIRST_NAME,
        
            AGENT_LAST_NAME,
        
            AGENT_EMAIL,
        
            DURATION_MINUTES,
        
            FLIGHT_CODE,
        
            FLIGHT_ID,
        
            FLIGHT_DATE,
        
            GATE,
        
        
            VALUE:name as name
            ,
        
            VALUE:passenger_id as passenger_id
            ,
        
            VALUE:ticket_number as ticket_number
            ,
        
            VALUE:seat_number as seat_number
            
        
    from demo_ask_db.demo_ask_schema.intermediate_airline_flights_passengers


)

select 
    *
from source_model
    )
;


  