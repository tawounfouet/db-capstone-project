use LittleLemonDB;

-- Task 1: Create a virtual table
drop view if exists OrdersView;
create view OrdersView as
select OrderID, Quantity, TotalCost from Orders
where Quantity > 2;

select * from OrdersView;

-- Task 2: Extract all customers with orders that cost more than $150
select Customers.CustomerID, FullName, OrderID, TotalCost, MenuName, CourseName, StarterName
from Customers inner join Bookings using (CustomerID)
inner join Orders using (BookingID)
inner join Menu using (MenuID)
inner join MenuItems using (MenuItemID)
order by TotalCost;

-- Task 3: Find all menu items for which more than 2 orders have been placed
select MenuName from Menu
where MenuID = ANY (select MenuID from Orders where Quantity > 2)
