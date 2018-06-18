use default;
show tables;

------------------------------------------------------------------

select * from sales_nocomma;

------------------------------------------------------------------

select
	count(*)
from
	sales_nocomma
where
	quote < 300 limit 100;

------------------------------------------------------------------

select
    s.rowid
    , s.orderdate
    , s.saleamount
from
    sales_nocomma s
limit 100;

------------------------------------------------------------------

select
    s.rowid as rowid
    , s.orderdate as orderdate
    , s.saleamount as saleamount
from
    sales_nocomma s
limit 100;

------------------------------------------------------------------

select
    ordermonthyear as ordermonth
    , count(*) as orderCount
from
    sales_nocomma
group by
    ordermonthyear;
	
------------------------------------------------------------------

select
    ordermonthyear as ordermonth
    , count(*) as orderCount
    , sum(s.saleamount) as TotalSales
    , avg(s.saleamount) as AvgSales
    , max(s.saleamount) as MaxSales
    , min(s.saleamount) as MinSales
from
    sales_nocomma s
group by
    ordermonthyear
order by
    ordermonthyear desc;

------------------------------------------------------------------

select
    ordermonthyear as ordermonth
    , productcategory as Category
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
group by
    ordermonthyear
    , productcategory
order by
    ordermonthyear desc;
	
------------------------------------------------------------------

select
    ordermonthyear as ordermonth
    , productcategory as Category
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
group by
    ordermonthyear
    , productcategory
grouping sets
    (ordermonthyear, productcategory);

------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
group by
    ordermonthyear
    , productcategory
grouping sets
    ((ordermonthyear, productcategory), ordermonthyear, productcategory);
	
------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
	, companyname as CompName
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
group by
    ordermonthyear
    , productcategory
    , companyname
grouping sets
    ((ordermonthyear, productcategory)
    ,(productcategory, companyname)
    , ordermonthyear
    , productcategory
    , companyname);
	
------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
where
    ordermonthyear between '2009-01-01' and '2009-02-01'
group by
    ordermonthyear
    , productcategory
with cube;

------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
where
    ordermonthyear between '2009-01-01' and '2009-02-01'
group by
    ordermonthyear
    , productcategory
with rollup;

------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
	, companyname
    , sum(s.saleamount) as TotalSales
from
    sales_nocomma s
where
    ordermonthyear between '2009-01-01' and '2009-02-01'
group by
    ordermonthyear
    , productcategory
    , companyname
grouping sets
    ((ordermonthyear, companyname)
    , ordermonthyear
    , productcategory
    , companyname); 
	
------------------------------------------------------------------

select
    ordermonthyear as ordermonth
	, productcategory as Category
    , sum(saleamount) as TotalSales
    , count(*) as TotalCnt
from
    sales_nocomma
where
    ordermonthyear between '2009-01-01' and '2009-02-01'
group by
    ordermonthyear
    , productcategory
having
    TotalSales > 200000; 

------------------------------------------------------------------
