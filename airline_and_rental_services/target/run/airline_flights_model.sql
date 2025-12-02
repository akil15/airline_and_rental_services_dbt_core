
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.airline_flights_model
    
    
    
    as (select
    _ID,
    AGENT_EMAIL, 
    AGENT_FIRST_NAME, 
    AGENT_LAST_NAME, 
    DESTINATION, 
    DURATION_MINUTES, 
    EQUIPMENT, 
    FLIGHT_CODE, 
    FLIGHT_DATE, 
    FLIGHT_ID, 
    FLOW_PUBLISHED_AT, 
    GATE, 
    ORIGIN, 
    PASSENGERS, 
    SEATS_AVAILABLE    
from 
    demo_ask_db.airline.flights
    )
;


  