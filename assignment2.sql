create database assignment2;
use assignment2;
create table customer(customer_id char(25));
insert into customer values('Abhinash');
insert into customer values('Vipin');
insert into customer values('Mahesh');
insert into customer values('Bijoy');
insert into customer values('Bhabani');
insert into customer values('Ashutosh');
select * from customer; 
create table voucher(voucher_id char(15));
insert into voucher values('ABXFH');
insert into voucher values('SDFGH');
insert into voucher values('ERTYY');
insert into voucher values('PPLKM');
select * from voucher; 
ALTER TABLE  customer ADD dum1 integer;
ALTER TABLE voucher ADD dum2 integer;




with customer_id as 
(select customer_id,row_number() over(order by dum1) as rn_cust from customer),
voucher_id as 
(select voucher_id,row_number() over(order by dum2) as rn_voucher from voucher)

select a.customer_id as customer_key,ifnull(b.voucher_id,'-') as gift_voucher_key
from customer_id as a 
left join voucher_id as b 
on (a.rn_cust = b.rn_voucher);







