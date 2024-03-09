use LittleLemonDB;

-- Task 1: Populate the Bookings table  (BookingID is AUTO INCREMENT field)
INSERT INTO Bookings (BookingDate, TableNo, BookingSlot, CustomerID, StaffID)
VALUES
('2022-10-10', 5, '19:00:00', 1, 1),
('2022-11-12', 3, '21:00:00', 2, 1),
('2022-10-11', 2, '15:00:00', 3, 3),
('2022-10-13', 2, '17:30:00', 4, 4),
('2023-04-17', 1, '18:30:00', 5, 2),
('2023-07-30', 8, '20:00:00', 6, 5);

select * from Bookings;

-- Task 2: Create a stored procedure to check whether a table in the restaurant is already booked
drop procedure if exists CheckBooking;

DELIMITER //
create procedure CheckBooking (input_date date, input_table_no int)
begin
	set @booking_id = null;

	select BookingID into @booking_id from Bookings
    where BookingDate = input_date and TableNo = input_table_no;
    
    if @booking_id is null then
		select concat("Table ", input_table_no, " has not been booked") as "Booking Status";
	else
		select concat("Table ", input_table_no, " is already booked") as "Booking Status";
	end if;
end //
DELIMITER ;

-- select * from bookings;
call CheckBooking('2023-07-30', 8);

-- Task 3: Little Lemon need to verify a booking, 
-- and decline any reservations for tables that are already booked under another name
drop procedure if exists AddValidBooking;

DELIMITER //
create procedure AddValidBooking (input_date date, input_table_no int)
begin 
	START TRANSACTION;
    insert into Bookings (BookingDate, TableNo, BookingSlot, CustomerID, StaffID)
	values (input_date, input_table_no, '00:00:00', 0, 0);
    
    set @cnt_booking = 0;

	select count(BookingID) into @cnt_booking from Bookings
    where BookingDate = input_date and TableNo = input_table_no;
    
    if @cnt_booking = 1 then
		commit;
		select concat("You have successfully booked table ", input_table_no, " on ", input_date) 
        as "Booking Status";
	else
		rollback;
		select concat("Table ", input_table_no, " is already booked on ", input_date , "- booking cancelled") 
        as "Booking Status";
    end if;
end //
DELIMITER ;

select * from bookings;
call AddValidBooking("2023-10-10", 5)
