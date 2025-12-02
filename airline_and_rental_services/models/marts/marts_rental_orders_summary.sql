select  
    _ID,
    RENTAL_ID,
    PRICE_USD,
    LICENSE_PLATE,
    LAST_NAME as CUSTOMER_LAST_NAME,
    FIRST_NAME as CUSTOMER_FIRST_NAME,
    EMAIL,
    CAR_TYPE,
    RENTAL_DATE,
    RETURN_DATE,
    PICKUP_LOCATION,
    DROP_OFF_LOCATION,
    EXTRA_DRIVER, 
    GPS, 
    CHILD_SEAT,
    INSURANCE
from 
    {{ref("intermediate_rental_info_model")}} as rental_info
natural join (
    select EXTRA_DRIVER, GPS, CHILD_SEAT,INSURANCE from {{ref("intermediate_rental_options_model")}} as rental_options
)