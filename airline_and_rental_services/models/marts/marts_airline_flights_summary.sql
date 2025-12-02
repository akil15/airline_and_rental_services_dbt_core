select
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
    {{ref("intermediate_airline_flights_passenger")}}