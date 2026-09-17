# SAP ABAP Sales Order Report

## About the Project

This is a small SAP ABAP project , created to practice ABAP programming using a real SAP sales order reporting example.

The report gets sales order data from the standard SAP tables VBAK and VBAP and displays the result in an ALV report.

## What I used

* SAP ABAP
* SAP GUI
* Eclipse / ABAP Development Tools
* Open SQL
* Internal Tables
* SALV ALV

## What the program does

The program allows the user to enter:

* Sales Order Number
* Customer Number
* Creation Date

Based on the entered values, the program gets the matching sales order details from VBAK and VBAP.

I used an INNER JOIN between VBAK and VBAP using the sales order number (VBELN).

The result is stored in an internal table and displayed using CL_SALV_TABLE.

## Tables Used

### VBAK

Used the following fields from VBAK:

* VBELN - Sales Order Number
* ERDAT - Creation Date
* KUNNR - Customer Number
* NETWR - Net Value

### VBAP

Used the following fields from VBAP:

* POSNR - Item Number
* MATNR - Material Number
* KWMENG - Order Quantity
* NETPR - Net Price

## ABAP concepts I practiced

Through this project I practiced:

* SELECT-OPTIONS
* Structures using TYPES
* Internal Tables
* Open SQL
* INNER JOIN
* Modern ABAP syntax using @
* IF conditions
* TRY and CATCH
* SALV ALV
* Basic exception handling

## How it works

First, the user enters the required selection values.

Then the program selects the required data from VBAK and VBAP.

The data is stored in the internal table GT_ORDERS.

If records are found, the program creates an ALV using CL_SALV_TABLE and displays the data.

If no records are found, it shows a message saying that no records were found.

## Output

The final output is displayed in an ALV table with details such as:

Sales Order, Date, Customer, Net Value, Item, Material, Quantity and Net Price.
