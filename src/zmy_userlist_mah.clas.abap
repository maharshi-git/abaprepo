CLASS zmy_userlist_mah DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmy_userlist_mah IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.

  data:lt_user TYPE STANDARD TABLE OF zuser_data_mah.
       lt_user = VALUE #(
       ( customer_id = '000077' customer_name = 'VILLA'   customer_surname = '7000000' )

         ).
         INSERT zuser_data_mah FROM TABLE @lt_user.
         IF SY-SUBRC IS INITIAL.
         OUT->WRITE( 'DATA IS INSERTED INTO DB TABLE SUCCESFULLY' ).
         OUT->WRITE( lt_user ).
         ELSE.
         OUT->WRITE( 'DATA INSERTION FAILED' ).
         ENDIF.

  ENDMETHOD.

ENDCLASS.
