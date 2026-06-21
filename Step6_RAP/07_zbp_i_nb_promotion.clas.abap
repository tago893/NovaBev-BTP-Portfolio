CLASS lhc_promotion DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateDiscount FOR VALIDATE ON SAVE
      IMPORTING keys FOR Promotion~validateDiscount.

    METHODS validateDateRange FOR VALIDATE ON SAVE
      IMPORTING keys FOR Promotion~validateDateRange.

    METHODS validateCompanyCode FOR VALIDATE ON SAVE
      IMPORTING keys FOR Promotion~validateCompanyCode.

    METHODS defaultIsActive FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Promotion~defaultIsActive.

ENDCLASS.

CLASS lhc_promotion IMPLEMENTATION.

  METHOD validateDiscount.
    READ ENTITIES OF zi_nb_promotion IN LOCAL MODE
      ENTITY Promotion FIELDS ( DiscountPct )
      WITH CORRESPONDING #( keys )
      RESULT DATA(promotions).

    LOOP AT promotions ASSIGNING FIELD-SYMBOL(<p>).
      IF <p>-DiscountPct < 0 OR <p>-DiscountPct > 50.
        APPEND VALUE #( %tky        = <p>%tky
                        %state_area = 'VALIDATE_DISCOUNT' ) TO failed-promotion.
        APPEND VALUE #(
          %tky                = <p>%tky
          %state_area         = 'VALIDATE_DISCOUNT'
          %msg                = NEW /dmo/cm_flight_messages(
                                  textid   = /dmo/cm_flight_messages=>discount_invalid
                                  severity = if_abap_behv_message=>severity-error )
          %element-DiscountPct = if_abap_behv=>mk-on
        ) TO reported-promotion.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateDateRange.
    READ ENTITIES OF zi_nb_promotion IN LOCAL MODE
      ENTITY Promotion FIELDS ( ValidFrom ValidTo )
      WITH CORRESPONDING #( keys )
      RESULT DATA(promotions).

    LOOP AT promotions ASSIGNING FIELD-SYMBOL(<p>).
      IF <p>-ValidFrom > <p>-ValidTo.
        APPEND VALUE #( %tky = <p>%tky %state_area = 'VALIDATE_DATERANGE' ) TO failed-promotion.
        " add reported entry similar to above
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateCompanyCode.
    DATA(allowed_codes) = VALUE string_table( ( |NB01| ) ( |NB02| ) ( |NB03| ) ).
    READ ENTITIES OF zi_nb_promotion IN LOCAL MODE
      ENTITY Promotion FIELDS ( CompanyCode )
      WITH CORRESPONDING #( keys )
      RESULT DATA(promotions).

    LOOP AT promotions ASSIGNING FIELD-SYMBOL(<p>).
      IF NOT line_exists( allowed_codes[ table_line = <p>-CompanyCode ] ).
        APPEND VALUE #( %tky = <p>%tky %state_area = 'VALIDATE_COMPANYCODE' ) TO failed-promotion.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD defaultIsActive.
    MODIFY ENTITIES OF zi_nb_promotion IN LOCAL MODE
      ENTITY Promotion
        UPDATE FIELDS ( IsActive )
        WITH VALUE #( FOR k IN keys ( %tky = k-%tky IsActive = abap_true ) )
      REPORTED DATA(report_default).
  ENDMETHOD.

ENDCLASS.
