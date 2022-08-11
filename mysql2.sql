/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select P.Name as productName, C.Name as categoryName
From products AS P
Inner Join categories as C
On C.CategoryID = P.CategoryID
Where C.Name = "Computers";

Select products.Name, categories.Name 
From products
Inner Join categories on categories.CategoryID = products.CategoryID
Where categories.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.Price, r.Rating from products as p
inner join reviews as r on r.ProductID = p.ProductID
where r.Rating = 5;

SELECT products.Name as "Product Name", products.Price, reviews.Rating
FROM products
INNER JOIN reviews on reviews.ProductID = products.ProductID 
WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, Sum(s.Quantity) AS total
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
Group by e.EmployeeID
Order by total desc
limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as "Department name", c.name as "Category name" from departments as d
INNER join categories as c ON c.DepartmentID = d.DepartmentID
Where c.Name = "Appliances" or c.name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name, Sum(s.Quantity) as "Total Sold", Sum(s.Quantity * s.PricePerUnit) as "total price"
from products as p 
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;
-- verify
select * from sales where productID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.Reviewer, r.Rating, r.Comment
from products as p
INNER JOIN reviews as r ON r.productID = p.ProductID 
where p.ProductID = 857 and r.Rating = 1;

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) AS TotalSold
from sales as s 
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
Group by e.EmployeeID, p.ProductID
order by e.FirstName;