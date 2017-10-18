USE BeaverStoreDb

/* Use SELECT* to display all the records from all the tables */
SELECT *
FROM Customer
SELECT *
FROM Orders
SELECT *
FROM Product
SELECT*
FROM OrderDetails

/* Use aggreagte function: We want to know what is the total due for each order */
SELECT COUNT(OrderID) as Number_of_Orders, TotalDUE
FROM OrderDetails
GROUP BY TotalDue

/* Using inner join: We want to know the Sum of TotalDue of the purchases by the customers who are from China. Display the customers' name as well */
select c.FirstName, c.LastName, SUM(d.TotalDue) as Total_Purchases
from Orders as o 
Join OrderDetails as d
ON o.OrderID = d.OrderID
Join Customer as c
ON c.CustomerID = o.CustomerID
Where c.Country = 'China'
Group by c.FirstName, c.LastName;

/* Right-outer join: Display ordersubtotals for all of the states regardless of international or domestic*/
select c.FirstName, c.LastName,  c.State, o.OrderSubtotal
from Orders as o
Right Join Customer as c
On o.CustomerID = c.CustomerID;


/*7, Write a subquery to show the OrderID of those orders where the OrderSubtotal is greater than the minimum of the subtotal on all the orders*/
SELECT  OrderID, OrderSubtotal
FROM Orders
WHERE OrderSubtotal > (SELECT min(OrderSubtotal)
                       FROM Orders)
ORDER BY OrderSubtotal;


