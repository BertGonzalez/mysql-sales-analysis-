-- Seleccionar desde la tabla Sales
select * from sales;

-- Mostrar algunas columnas 
select SaleDate, Amount, Customers from sales;
select Amount, Customers, GeoID from sales; 

-- Incluir columnas calculadas 
select SaleDate, Amount, Boxes, Amount / boxes from sales; 

-- Renombrar un campo 
Select SaleDate, Amount, Boxes, Amount / boxes as 'Amount per box'  from sales;

-- Usando Where
select * from sales
where amount > 10000;

-- Ventas mayores a 10.000
select * from sales
where amount > 10000
order by amount desc;

-- Ventas en GeoID = G1

select * from sales
where geoid='g1'
order by PID, Amount desc;

-- Ventas mayores a 10.000 y con fecha 2022-01-01
select * from sales
where amount >10000 and SaleDate >= " 2022-01-01";

-- Ventas solo del año 2022
select SaleDate, Amount from sales
where amount >10000 and year(SaleDate) = 2022
order by amount desc; 

-- Ventas hasta 50 cajas
select * from sales
where boxes >0 and boxes <=50; 

-- Indicar ventas del día 4 de la semana (jueves)
select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales
where weekday(SaleDate) = 4;

-- Clasificación de ventas 
select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;

-- Detalle de envíos de ventas mayores a 10.000 y menos de 100 cajas
select * from sales where amount > 2000 and boxes <100;

-- Cuantos envíos fueron realizados en enero del 2022
select p.Salesperson, count(*) as "Shipment Count"
from sales s
join people p on s.spid = p.spid
where SaleDate between "2022-01-01" and "2022-01-31"
group by p.Salesperson;

-- ¿Cuál producto vende más cajas? Milk Bars o Eclair 
select pr.product, sum(boxes) as "Total Boxes"
from sales s
join products pr on s.pid = pr.pid
where  pr.product in ("Milk Bars", "Eclairs")
group by pr.product;

-- ¿Cuál productos  venden más cajas en los primeros 15 días 
-- de febrero 2022, Milk bars o Eclairs
select pr.product, sum(boxes) as "Total Boxes"
from sales s 
join products pr on s.pid = pr.pid
where pr. product in ("Milk Bars", "Eclairs")
and s.saledate between "2022-02-01" and "2022-02-15"
group by pr.product;

-- ¿Qué envíos tuvieron menos de 50 clientes y menos de 100 cajas? 
select * from sales 
where customers < 50 and boxes < 100 ;





