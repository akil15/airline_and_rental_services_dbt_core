with source_model as (
    {{ flatten_complex_json_column(
        model_name=ref("rental_model"),
        json_column='RENTAL_INFO',
        column_list=["_ID","RENTAL_ID","PRICE_USD","LICENSE_PLATE","LAST_NAME","FIRST_NAME","EMAIL","CAR_TYPE"] 
    )}}
)

select 
    *
from source_model