# ProductManagement
## Modules
### Manage set top box type
### Manage channels
### Manage channel packages
# SQL SCHEMAS
```sql
CREATE TABLE STB (
STB_ID NUMBER NOT NULL PRIMARY KEY,
STB_TYPE VARCHAR(10) NOT NULL,
STB_PRICE NUMBER NOT NULL,
STB_INSTALLATION_CHARGE NUMBER NOT NULL,
STB_UPGRADATION_CHARGE NUMBER NOT NULL,
STB_DISCOUNT NUMBER NOT NULL,
STB_BILLING_TYPE CHAR(10),
STB_REFUNDABLE_DEPOSITS NUMBER,
STB_LENGTH NUMBER,
STB_BREADTH NUMBER,
STB_HEIGHT NUMBER
);

ALTER TABLE STB
ADD Customer_Id number references customer(customer_Id);

CREATE TABLE STB_INVENTORY(
STB_ID NUMBER REFERENCES STB(STB_ID),
STB_MAC_ID NUMBER NOT NULL PRIMARY KEY,
STB_TYPE VARCHAR(10) NOT NULL,
REMOTE_CONTROL_ASSET_ID NUMBER NOT NULL UNIQUE,
STB_SERIAL_NUMBER NUMBER NOT NULL UNIQUE,
DISH_ASSET_ID NUMBER NOT NULL UNIQUE,
STB_STATUS NUMBER,
RETAILLER_ID NUMBER
);

CREATE TABLE STB_FEATURES(
STB_ID NUMBER REFERENCES STB(STB_ID),
STB_FEATURE_1 VARCHAR(20),
STB_FEATURE_2 VARCHAR(20),
STB_FEATURE_3 VARCHAR(20),
STB_FEATURE_4 VARCHAR(20),
STB_FEATURE_5 VARCHAR(20),
STB_FEATURE_6 VARCHAR(20),
STB_FEATURE_7 VARCHAR(20),
STB_FEATURE_8 VARCHAR(20),
STB_FEATURE_9 VARCHAR(20),
STB_FEATURE_10 VARCHAR(20)
);

CREATE TABLE MANAGE_CHANNELS(
STB_ID NUMBER REFERENCES STB(STB_ID),
CH_ID NUMBER NOT NULL PRIMARY KEY,
CH_NAME VARCHAR2(20) NOT NULL,
CH_BAND VARCHAR2(20) NOT NULL,
CH_VC_FREQUENCY NUMBER(5,2) NOT NULL,
CH_AC_FREQUENCY NUMBER(5,2) NOT NULL,
CH_CHARGE_TYPE VARCHAR2(20) NOT NULL,
CH_TRANS_TYPE VARCHAR2(20) NOT NULL,
CH_CHARGE NUMBER NOT NULL
);

CREATE TABLE MANAGE_CHANNEL_PACKAGES(
CH_PACKAGE_ID NUMBER NOT NULL PRIMARY KEY,
CH_ID NUMBER REFERENCES MANAGE_CHANNELS(CH_ID),
CH_PACKAGE_NAME VARCHAR2(20) NOT NULL,
CH_PACKAGE_CATEGORY VARCHAR2(20) NOT NULL,
CH_PACKAGE_CHARGING_TYPE VARCHAR2(20) NOT NULL,
CH_PACKAGE_TRANS_TYPE VARCHAR2(20) NOT NULL,
PACKAGE_COST NUMBER(5,2) NOT NULL,
PACKAGE_AVAILABLE_TO_DATE DATE,
PACKAGE_AVAILABLE_FROM_DATE DATE,
PACKAGE_DEFAULT CHAR(1) CHECK (PACKAGE_DEFAULT IN ('Y','N'))
);

create table customer(
Customer_Id number primary key,
First_Name varchar(30) not null,
Last_Name varchar(30) not null,
Email varchar(50) not null,
Phone_No number not null,
Address varchar(100) not null,
City varchar(30) not null,
State varchar(30) not null,
creation_date date not null,
Operator_Id number references Operator(Operator_Id),
retailer_Id number references retailer(retailer_Id)
);

create table retailer
(
retailer_id number primary key,
name varchar(30) not null,
contact_no_1 number not null,
contact_no_2 number not null,
address_1 varchar(30) not null,
address_2 varchar(30) not null,
zipcode number not null,
city varchar(30) not null,
state varchar(30) not null,
set_top_box_limit number not null,
credit_limit number not null,
commission_percent number not null,
service_charges number not null,
creation_date date not null
);

create table Operator(
Operator_Id Number Primary key,
First_Name varchar(30) Not Null,
Last_Name varchar(30) Not Null,
Email varchar(50) Not Null,
Phone_No number Not Null,
Shift_Time_Start date Not null,
Shift_Time_End date not null,
Max_No_of_Customers number not null,
Creation_Date date not null
);
```
