
  
    

create or replace transient  table demo_ask_db.demo_ask_schema.marts_airline_flights_summary
    
    
    
    as (select
    _ID, 
    ORIGIN,
    DESTINATION,
    AGENT_FIRST_NAME,
    AGENT_LAST_NAME,
    FLIGHT_CODE,
    FLIGHT_ID,
    FLIGHT_DATE,
    GATE,
    TICKET_NUMBER,
    SEAT_NUMBER,
    split_part(NAME,' ',1) as PASSENGER_FIRST_NAME,
    split_part(NAME,' ',2) as PASSENGER_LAST_NAME
from
    demo_ask_db.demo_ask_schema.intermediate_airline_flights_passenger
    )
;


  