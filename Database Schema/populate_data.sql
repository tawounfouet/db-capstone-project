use littlelemondb;

insert into customers (CustomerID, FullName, Email, ContactNumber) values
(0, 'unknown', 'unknown', 'unknown'),
(1, "Vanessa McCarthy", "vaMcCar@gmail.com", 013456789),
(2, "Marcos Romero", "marRo@gmail.com", 013456789),
(3, "Anna Iversen", "anIve@gmail.com", 013456789),
(4, "Joakim Iversen", "joIve@gmail.com", 013456789),
(5, "Hiroki Yamane", "hiYama@gmail.com", 013456789),
(6, "Diana 'Pinto", "diaPinto@gmail.com", 013456789);
-- select * from customers;

INSERT INTO Staffs (StaffID, StaffName, Role, Address, Email, ContactNumber, AnnualSalary)
VALUES
(0, 'unknown', 'unknown', 'unknown', 'unknown', 'unknown', 0),
(1, 'Mario Gollini', 'Manager', '724, Parsley Lane, Old Town, Chicago, IL', 'Mario.g@littlelemon.com', 351258074, '70000'),
(2, 'Adrian Gollini', 'Assistant Manager', '334, Dill Square, Lincoln Park, Chicago, IL', 'Adrian.g@littlelemon.com', 351474048, '65000'),
(3, 'Giorgos Dioudis', 'Head Chef', '879 Sage Street, West Loop, Chicago, IL', 'Giorgos.d@littlelemon.com', 351970582, '50000'),
(4, 'Fatma Kaya', 'Assistant Chef', '132  Bay Lane, Chicago, IL', 'Fatma.k@littlelemon.com', 351963569, '45000'),
(5, 'Elena Salvai', 'Head Waiter', '989 Thyme Square, EdgeWater, Chicago, IL', 'Elena.s@littlelemon.com', 351074198, '40000'),
(6, 'John Millar', 'Receptionist', '245 Dill Square, Lincoln Park, Chicago, IL', 'John.m@littlelemon.com', 351584508, '35000');
-- select * from Staffs;

INSERT INTO Bookings (BookingDate, TableNo, BookingSlot, CustomerID, StaffID)
VALUES
('2022-10-10', 5, '19:00:00', 1, 1),
('2022-11-12', 3, '21:00:00', 2, 1),
('2022-10-11', 2, '15:00:00', 3, 3),
('2022-10-13', 2, '17:30:00', 4, 4),
('2023-04-17', 1, '18:30:00', 5, 2),
('2023-07-30', 8, '20:00:00', 6, 5);
-- select * from Bookings;

INSERT INTO MenuItems (MenuItemID, CourseName, StarterName, DessertName, Drink, Price)
VALUES
(1, 'Greek salad', 'Olives', 'Greek yoghurt', 'Athens White Wine', 52),
(2, 'Pizza', 'Minestrone', 'Cheesecake', 'Italian Coffee', 37),
(3, 'Kabasa', 'Falafel', 'Ice cream', 'Turkish Coffee', 40),
(4, 'Bean soup', 'Flatbread', 'Ice cream', 'Corfu Red Wine', 53);
-- select * from MenuItems;

INSERT INTO Menu (MenuID, MenuItemID, MenuName, Cuisine)
VALUES
(1, 3, 'Manti', 'Turkish'),
(2, 1, 'Moussaka', 'Greek'),
(3, 2, 'Aperitivo', 'Italian');
-- select * from Menu;

INSERT INTO Orders (OrderID, MenuID, BookingID, Quantity, TotalCost)
VALUES
(1, 1, 1, 5, 250),
(2, 2, 2, 3, 200),
(3, 2, 3, 1, 47),
(4, 3, 4, 2, 105),
(5, 1, 5, 1, 86);
-- select * from Orders;

