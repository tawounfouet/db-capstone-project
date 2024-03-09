use LittleLemonDB;

-- Task 1: Create a procedure that displays the maximum ordered quantity in the Orders table. 
drop procedure if exists GetMaxQuantity;
create procedure GetMaxQuantity()
select MAX(Quantity) as "Max Quantity in Orders" from Orders;

call  GetMaxQuantity();

--  Task 2: Create a prepared statement
prepare GetOrderDetail from 
"select OrderID, Quantity, TotalCost 
from Orders inner join Bookings using (BookingID) 
where CustomerID = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3: Create a procedure to delete an order record based on the user input of the order id.
drop procedure if exists CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN input_order_id INT)
BEGIN
	delete from Orders where OrderID = input_order_id;
    select concat("Order ", input_order_id, " is cancelled") as Confirmation;
END //
DELIMITER ;

call CancelOrder(5);
-- select * from Orders;