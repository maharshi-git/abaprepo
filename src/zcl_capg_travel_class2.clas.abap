CLASS zcl_capg_travel_class2 DEFINITION

PUBLIC

FINAL

CREATE PUBLIC .

PUBLIC SECTION.

INTERFACES if_oo_adt_classrun.

PROTECTED SECTION.

PRIVATE SECTION.

ENDCLASS.

CLASS zcl_capg_travel_class2 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

DATA itab TYPE TABLE OF ZCAPG_TABLE2.

* fill internal travel table (itab)

itab = VALUE #(

( mykey = '01' travel_id = '00000022' agency_id = '070001' customer_id = '000077' begin_date = '20230124' end_date = '20230128' booking_fee = '600.00' currency_code = 'USD')

( mykey = '02' travel_id = '00000106' agency_id = '070005' customer_id = '000005' begin_date = '20230304' end_date = '20230308' booking_fee = '170.00' currency_code = 'AFN')

( mykey = '03' travel_id = '00000103' agency_id = '070010' customer_id = '000011' begin_date = '20230825' end_date = '20230829' booking_fee = '170.00' currency_code = 'AFN')

).

* delete existing entries in the database table

DELETE FROM ZCAPG_TABLE2.

* insert the new table entries

INSERT ZCAPG_TABLE2 FROM TABLE @itab.

* output the result as a console message

out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

ENDMETHOD.

ENDCLASS.
