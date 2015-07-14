
-- productos de la línea "Classic Cars" coy precio es superiro a 95
create or replace view ClassicCarsProduct as 
select productCode, productName, buyPrice from products
where 
-- buyPrice > 95.0 and   ---error
   productLine = 'Classic Cars' ;


-- productos de la línea "Vintage Cars" 
create or replace view VintageCarsProduct as 
select productCode, productName, buyPrice from products
where productLine = 'Vintage Cars';


-- Pedidos de productos de la línea "Classic Cars" en estado 'In Process'	 
create or replace view ClassicOrders as
select O.orderNumber, O.productCode , C.productName, C.buyPrice, O.priceEach
from orderdetails as O , ClassicCarsProduct as C, orders OO
where O.productCode = C.productCode 
and OO.status = 'In Process'
and OO.orderNumber = O.orderNumber;

-- Pedidos de productos de la línea "Vintage Cars" en estado 'In Process'	 
create or replace view VintageOrders as
select O.orderNumber, O.productCode , V.productName, V.buyPrice, O.priceEach
from orderdetails as O , VintageCarsProduct as V, orders OO
where O.productCode = V.productCode 
and OO.status = 'In Process'   
and OO.orderNumber = O.orderNumber ;
  
-- Main View  :
-- Pedidos que contienen algun producto del tipo "Vintage", que no contienen
-- nungun producto del tipo "Classic" por valor superior a 95
-- 
create or replace view VintageMinusClassicOrders as
  select orderNumber from VintageOrders
  except
  select orderNumber from ClassicOrders  ;  
  
