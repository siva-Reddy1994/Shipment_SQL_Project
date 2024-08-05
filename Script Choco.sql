# 1 - See all Shipments

SELECT product,Date,Amount,Boxes FROM shipments;

# 2 - All Shipments by SP02

SELECT * FROM shipments s 
WHERE s.`Sales Person` = 'SP02';

# 3 - All Shipments by SP02 to G03

SELECT * FROM shipments s 
WHERE s.`Sales Person` = 'SP02' and s.Geo = 'G3'
ORDER BY Amount DESC;

# 4 - All Shipments in Jan 2023

SELECT * FROM shipments s
WHERE Date BETWEEN '2023-01-01' AND '2023-01-31';


# 5 - All Shipments by SP02, SP03, SP12, SP15

SELECT * FROM shipments S
 WHERE S.`Sales Person` IN ("SP02","SP03","SP12","SP15");

# 6 - Products that have word choco in them

SELECT * FROM products 
  WHERE product LIKE "%choco%";


# 7 - Sales persons whose name begins with S

SELECT * FROM `people-tel` P 
 WHERE P.`Sales Person` LIKE 'S%';

# 8 - Sales per box of chocolates in Feb 2023

SELECT S.Date,S.Amount,S.Boxes,S.Amount/S.Boxes AS Amount_per_box FROM shipments S
WHERE EXTRACT(year_month from S.date)=202302;


# 9 -  All Shipment data for Subbarao

SELECT P.`sales person`, S.Date, S.amount, S.Date,S.Amount, S.boxes 
 FROM shipments S JOIN `people-tel` P ON S.`Sales Person` = P.`sp id`
 WHERE P.`Sales Person` LIKE 'Subba%';


# 10 - All Shipment data for Subbarao by month

SELECT extract(year_month FROM S.Date) AS Month, SUM(S.amount) AS AMT,SUM(S.boxes) AS BXS
 FROM shipments S JOIN `people-tel` P ON S.`Sales Person` = P.`sp id`
 WHERE P.`Sales Person` LIKE 'Subba%' group by extract(year_month FROM S.Date);

# 11 - All Shipment data for Subbarao to USA


SELECT P.`Sales Person`,S.Amount,S.boxes,G.Geo
 FROM shipments S JOIN `people-tel` P ON S.`Sales Person` = P.`sp id`
 JOIN geo G ON S.Geo=G.GeoID
 WHERE P.`Sales Person` LIKE 'Subba%' AND G.Geo="USA";
 

# 12 - What is the maximum amount in each month?

SELECT extract(year_month FROM S.Date) AS Month, MAX(S.amount) AS AMT
 FROM shipments S group by extract(year_month FROM S.Date);



# 13 - How many shipments we can do by each country in the month of march 2023

SELECT G.geo, COUNT(*),SUM(S.amount) AS AMT
 FROM shipments S JOIN geo G ON S.Geo=G.GeoID WHERE extract(year_month FROM S.Date)='202303'
 GROUP BY G.geo;
 

 
