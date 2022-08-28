create database assignment;
use assignment;
create table purchase(bill_id integer,customer integer,prodt_id integer,sale_qty integer,bill_amt integer,bill_date char(10));
select * from purchase;
create table product(prodt_id integer,dep_id integer,cat_id integer);
select * from product;
with join_cte as 
(
select b.cat_id,a.prodt_id,sum(a.sale_qty) as sale_qty
from purchase as a 
left join product as b 
on (a.prodt_id = b.prodt_id)
where a.bill_date between current_date-31 and current_date-1
group by b.cat_id,a.prodt_id
),
rank_cte as 
(
select c.*,DENSE_RANK()over(partition by cat_id order by sale_qty desc) as dn_rnk
from join_cte as c
)

select cat_id,prodt_id,dn_rnk as Trending from rank_cte where dn_rnk <= 2 order by cat_id;


