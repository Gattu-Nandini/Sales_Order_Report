*&---------------------------------------------------------------------*
*& Report ZSD_SALES_ORDER_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------
REPORT zsd_sales_order_report.

TABLES: vbak, vbap.

SELECT-OPTIONS: s_vbeln FOR vbak-vbeln,
                s_kunnr FOR vbak-kunnr,
                s_erdat FOR vbak-erdat.




TYPES: BEGIN OF ty_order,
         vbeln  TYPE vbak-vbeln,
         erdat  TYPE vbak-erdat,
         kunnr  TYPE vbak-kunnr,
         netwr  TYPE vbak-netwr,
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         kwmeng TYPE vbap-kwmeng,
         netpr  TYPE vbap-netpr,
       END OF ty_order.

DATA: gt_orders TYPE TABLE OF ty_order.

START-OF-SELECTION.

  SELECT a~vbeln, a~erdat, a~kunnr, a~netwr,
         b~posnr, b~matnr, b~kwmeng, b~netpr
    FROM vbak AS a
    INNER JOIN vbap AS b ON a~vbeln = b~vbeln
    INTO TABLE @gt_orders
    WHERE a~vbeln IN @s_vbeln
      AND a~kunnr IN @s_kunnr
      AND a~erdat IN @s_erdat.

  IF gt_orders IS NOT INITIAL.

    TRY.
        cl_salv_table=>factory(
          IMPORTING r_salv_table = DATA(lo_alv)
          CHANGING  t_table      = gt_orders ).

        lo_alv->get_functions( )->set_all( abap_true ).
        lo_alv->get_columns( )->set_optimize( abap_true ).
        lo_alv->display( ).

      CATCH cx_salv_msg INTO DATA(lx_salv_msg).
        MESSAGE lx_salv_msg->get_text( ) TYPE 'I'.
    ENDTRY.

  ELSE.
    MESSAGE 'No records found for the given selection.' TYPE 'I'.
  ENDIF.
