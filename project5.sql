CREATE TABLE "Car" (
  "id" SERIAL primary key,
  "make" varchar(225),
  "year" integer,
  "serial_n" varchar(225),
  "new" boolean
);

CREATE TABLE "Customers" (
  "id" SERIAL primary key,
  "name" varchar(225),
  "address" varchar(225),
  "phon_n" varchar(225),
  "email" varchar(225) 
);

CREATE TABLE "Salers" (
  "id" int primary key,
  "make" varchar(225),
  "year" integer,
  "serial_n" varchar(225),
  "new" boolean
);

CREATE TABLE "Mechanics" (
  "id" int primary key,
  "name" varchar(225),
  "rate" decimal(10,2)
);

CREATE TABLE "Invoices" (
  "id" SERIAL primary key,
  "saler_id" integer, 
  "cust_id" integer,
  "car_id" integer,
  "total_price"  decimal(10,2) ,
  CONSTRAINT "FK_Invoices.saler_id"
    FOREIGN KEY ("saler_id")
      REFERENCES "Salers"("id"),
  CONSTRAINT "FK_Invoices.cust_id"
    FOREIGN KEY ("cust_id")
      REFERENCES "Customers"("id"),
  CONSTRAINT "FK_Invoices.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "Car"("id")
);

CREATE TABLE "Service tickets" (
  "id" SERIAL primary key,
  "car_id" integer,
  "cust_id" integer,
  "mech-id" integer,
  "date" (date),
  "descript" varchar(225),
  "status" enum('o', 'IP', 'o'),
  CONSTRAINT "FK_Service tickets.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "Car"("id"),
  CONSTRAINT "FK_Service tickets.cust_id"
    FOREIGN KEY ("cust_id")
      REFERENCES "Customers"("id")
);

CREATE TABLE "Service history" (
  "id" int primary key,
  "car_id" integer,
  "descrip" varchar(225),
  "service_date" date,
  CONSTRAINT "FK_Service history.car_id"
    FOREIGN KEY ("car_id")
      REFERENCES "Car"("id")
);

CREATE TABLE "parts" (
  "id" int primary key,
  "name" varchar(255),
  "cost" decimal(10,2)
);

CREATE TABLE "service ticket parts" (
  "id" int foreign key,
  "part_id" integer,
  "quantity" integer,
  CONSTRAINT "FK_service ticket parts.part_id"
    FOREIGN KEY ("part_id")
      REFERENCES "parts"("id"),
  CONSTRAINT "FK_service ticket parts.id"
    FOREIGN KEY ("id")
      REFERENCES "Service tickets"("id")
);

