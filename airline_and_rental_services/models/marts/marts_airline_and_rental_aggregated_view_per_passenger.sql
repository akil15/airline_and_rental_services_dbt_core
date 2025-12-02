select
    SURROGATE_KEYS,
    PASSENGER_LAST_NAME,
    PASSENGER_FIRST_NAME,
    OBJECT_CONSTRUCT(
    'flight_origin', FLIGHT_ORIGIN,
    'flight_destination',FLIGHT_DESTINATION,
    'gate', GATE,
    'rental_car_type', RENTAL_CAR_TYPE,
    'passenger_car_license_plate', PASSENGER_CAR_LICENSE_PLATE,
    'rental_car_pickup_location', RENTAL_CAR_PICKUP_LOCATION,
    'rental_car_dropoff_destination', RENTAL_CAR_DROP_OFF_LOCATION,
    'rental_car_options', RENTAL_CAR_OPTIONS_GPS,
    'rental_car_options_extra_driver', RENTAL_CAR_OPTIONS_EXTRA_DRIVER,
    'rental_car_options_insurance', RENTAL_CAR_OPTIONS_INSURANCE
    ) as PASSENGER_INFO
from
    {{ref("marts_airline_and_rental_summary")}}