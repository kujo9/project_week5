	CREATE OR REPLACE FUNCTION
	RETURNS VOID
	LANGUAGE plpgsql
	AS $$
		INSERT INTO car(
		  "id" SERIAL primary key,
		  "make" varchar(225),
		  "year" integer,
		  "serial_n" varchar(225),
		  "new" Boolean
		
		
		)



CREATE OR REPLACE FUNCTION update_service_status(vehicle_id INTEGER)
RETURNS void AS
$$
BEGIN
  UPDATE vehicles
  SET is_serviced = TRUE
  WHERE vehicle_id = vehicle_id
  AND NOT EXISTS (
    SELECT 1
    FROM services
    WHERE vehicle_id = vehicle_id
    AND service_type = 'Oil Change'
  );
END;
$$
LANGUAGE plpgsql;

ALTER TABLE vehicles
ADD COLUMN is_serviced BOOLEAN DEFAULT FALSE;