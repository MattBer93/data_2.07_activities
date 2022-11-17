-- 2.07
use bank; 

-- Activity 1

-- Find out how many cards of each type have been issued.
select * from card;
select type, count(type) as cards_count from card
group by type;

-- Find out how many customers there are by the district.
select * from client;
select district_id, count(client_id) as clients_count from client
group by district_id;
-- having clients_count > 100;

-- Find out average transaction value by type.
select * from trans;
select k_symbol, round(avg(amount), 2) as average_transaction from trans
group by type, k_symbol;

-- ---------------------------------- 

-- Activity 2
-- As you might have seen in the previous query, there are 19 rows returned by this query. 
-- But there a few places where the column k_symbol is an empty string. 
-- Your task it to use a filter to remove those rows of data. 
-- After the filter gets applied, you would see that the number of rows have reduced.

select k_symbol, round(avg(amount), 2) as average_transaction from trans
group by type, k_symbol
having k_symbol <> '' and k_symbol <> ' ';


-- Activity 3
select * from district;

-- find the districts with more than 100 clients
select district_id, count(client_id) as clients_amount from client
group by district_id
having clients_amount > '100';

-- Find the transactions (type, operation) with a mean amount greater than 10000.
select * from trans;
select 
	type, operation, avg(amount) as average from trans
group by type, operation
having average > 10000;
