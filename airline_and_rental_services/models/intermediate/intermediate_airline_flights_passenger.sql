with source_model as (
    {{ flatten_complex_json_column(
        model_name=ref("intermediate_airline_flights_passengers"),
        json_column='VALUE',
        column_list=['_ID',"ORIGIN","DESTINATION","AGENT_FIRST_NAME","AGENT_LAST_NAME","AGENT_EMAIL","DURATION_MINUTES","FLIGHT_CODE","FLIGHT_ID","FLIGHT_DATE","GATE"] 
    )}}
)

select 
    *
from source_model