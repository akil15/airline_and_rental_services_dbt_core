with tmp_table as (
    select
        * 
    from 
        demo_ask_db.demo_ask_schema.airline_flights_model,
        lateral flatten(input=>PASSENGERS) as json
)

select     
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
    VALUE,
    SEATS_AVAILABLE 
from tmp_table