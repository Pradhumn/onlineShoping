/*
Created: 7/23/2016
Modified: 7/23/2016
Model: PostgreSQL 9.3
Database: PostgreSQL 9.3
*/


-- Drop relationships section -------------------------------------------------

ALTER TABLE "address" DROP CONSTRAINT "cus_add"
;
ALTER TABLE "basket" DROP CONSTRAINT "cus_bas"
;
ALTER TABLE "basket" DROP CONSTRAINT "status_bas"
;
ALTER TABLE "basketproducts" DROP CONSTRAINT "prod_bask"
;
ALTER TABLE "basketproducts" DROP CONSTRAINT "pro_bas"
;
ALTER TABLE "products" DROP CONSTRAINT "manu_pro"
;
ALTER TABLE "category_product" DROP CONSTRAINT "pro_cat"
;
ALTER TABLE "category_product" DROP CONSTRAINT "cat_rel"
;
ALTER TABLE "category" DROP CONSTRAINT "Relationship1"
;




-- Drop keys for tables section -------------------------------------------------

ALTER TABLE "address" DROP CONSTRAINT "Key9"
;
ALTER TABLE "customer" DROP CONSTRAINT "Key8"
;
ALTER TABLE "basketstatus" DROP CONSTRAINT "Key7"
;
ALTER TABLE "basket" DROP CONSTRAINT "Key6"
;
ALTER TABLE "manufacturer" DROP CONSTRAINT "Key4"
;
ALTER TABLE "products" DROP CONSTRAINT "Key3"
;
ALTER TABLE "category" DROP CONSTRAINT "Key1"
;


-- Drop indexes section -------------------------------------------------

DROP INDEX "IX_Relationship9"
;
DROP INDEX "IX_Relationship7"
;
DROP INDEX "IX_Relationship8"
;
DROP INDEX "IX_Relationship5"
;
DROP INDEX "IX_Relationship6"
;
DROP INDEX "IX_Relationship4"
;
DROP INDEX "IX_Relationship2"
;
DROP INDEX "IX_Relationship3"
;
DROP INDEX "IX_Relationship1"
;

-- Drop tables section ---------------------------------------------------

DROP TABLE "address"
;
DROP TABLE "customer"
;
DROP TABLE "basketstatus"
;
DROP TABLE "basket"
;
DROP TABLE "basketproducts"
;
DROP TABLE "manufacturer"
;
DROP TABLE "products"
;
DROP TABLE "category_product"
;
DROP TABLE "category"
;


-- Create tables section -------------------------------------------------

-- Table category

CREATE TABLE "category"(
 "categoryid" Bigint NOT NULL,
 "name" Text
)
;

CREATE INDEX "IX_Relationship1" ON "category" ()
;

-- Add keys for table category

ALTER TABLE "category" ADD CONSTRAINT "Key1" PRIMARY KEY ("categoryid")
;

-- Table category_product

CREATE TABLE "category_product"(
 "categoryid" Bigint NOT NULL,
 "productid" Bigint NOT NULL
)
;

-- Create indexes for table category_product

CREATE INDEX "IX_Relationship2" ON "category_product" ("categoryid")
;

CREATE INDEX "IX_Relationship3" ON "category_product" ("productid")
;

-- Table products

CREATE TABLE "products"(
 "productid" Bigint NOT NULL,
 "name" Varchar,
 "description" Varchar,
 "price" Integer,
 "url" Varchar,
 "available" Integer,
 "taxclassid" Bigint,
 "manufacturerid" Bigint
)
;

-- Create indexes for table products

CREATE INDEX "IX_Relationship4" ON "products" ("manufacturerid")
;

-- Add keys for table products

ALTER TABLE "products" ADD CONSTRAINT "Key3" PRIMARY KEY ("productid")
;

-- Table manufacturer

CREATE TABLE "manufacturer"(
 "manufacturerid" Bigint NOT NULL,
 "name" Bigint,
 "address" Bigint
)
;

-- Add keys for table manufacturer

ALTER TABLE "manufacturer" ADD CONSTRAINT "Key4" PRIMARY KEY ("manufacturerid")
;

-- Table basketproducts

CREATE TABLE "basketproducts"(
 "basketid" Bigint NOT NULL,
 "prooductid" Bigint,
 "quantity" Integer,
 "productid" Bigint NOT NULL
)
;

-- Create indexes for table basketproducts

CREATE INDEX "IX_Relationship5" ON "basketproducts" ("productid")
;

CREATE INDEX "IX_Relationship6" ON "basketproducts" ("basketid")
;

-- Table basket

CREATE TABLE "basket"(
 "basketid" Bigint NOT NULL,
 "customerid" Bigint,
 "addeddate" Bigint,
 "basketstatuscode" Bigint
)
;

-- Create indexes for table basket

CREATE INDEX "IX_Relationship7" ON "basket" ("basketstatuscode")
;

CREATE INDEX "IX_Relationship8" ON "basket" ("customerid")
;

-- Add keys for table basket

ALTER TABLE "basket" ADD CONSTRAINT "Key6" PRIMARY KEY ("basketid")
;

-- Table basketstatus

CREATE TABLE "basketstatus"(
 "basketstatuscode" Bigint NOT NULL,
 "description" Bigint
)
;

-- Add keys for table basketstatus

ALTER TABLE "basketstatus" ADD CONSTRAINT "Key7" PRIMARY KEY ("basketstatuscode")
;

-- Table customer

CREATE TABLE "customer"(
 "customerid" Bigint NOT NULL,
 "firstname" Varchar,
 "lastname" Varchar,
 "birthdate" Date,
 "emailaddress" Varchar,
 "phonenumber" Integer,
 "password" Varchar
)
;

-- Add keys for table customer

ALTER TABLE "customer" ADD CONSTRAINT "Key8" PRIMARY KEY ("customerid")
;

-- Table address

CREATE TABLE "address"(
 "addressid" Bigint NOT NULL,
 "description" Varchar,
 "zipcode" Integer,
 "addresstype" Text,
 "country" Text,
 "customerid" Bigint
)
;

-- Create indexes for table address

CREATE INDEX "IX_Relationship9" ON "address" ("customerid")
;

-- Add keys for table address

ALTER TABLE "address" ADD CONSTRAINT "Key9" PRIMARY KEY ("addressid")
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "category" ADD CONSTRAINT "Relationship1" FOREIGN KEY () REFERENCES "category_product" () ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "category_product" ADD CONSTRAINT "cat_rel" FOREIGN KEY ("categoryid") REFERENCES "category" ("categoryid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "category_product" ADD CONSTRAINT "pro_cat" FOREIGN KEY ("productid") REFERENCES "products" ("productid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "products" ADD CONSTRAINT "manu_pro" FOREIGN KEY ("manufacturerid") REFERENCES "manufacturer" ("manufacturerid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "basketproducts" ADD CONSTRAINT "pro_bas" FOREIGN KEY ("productid") REFERENCES "products" ("productid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "basketproducts" ADD CONSTRAINT "prod_bask" FOREIGN KEY ("basketid") REFERENCES "basket" ("basketid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "basket" ADD CONSTRAINT "status_bas" FOREIGN KEY ("basketstatuscode") REFERENCES "basketstatus" ("basketstatuscode") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "basket" ADD CONSTRAINT "cus_bas" FOREIGN KEY ("customerid") REFERENCES "customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "address" ADD CONSTRAINT "cus_add" FOREIGN KEY ("customerid") REFERENCES "customer" ("customerid") ON DELETE NO ACTION ON UPDATE NO ACTION
;





