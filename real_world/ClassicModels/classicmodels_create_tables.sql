/multiline on

DROP TABLE customers;
CREATE TABLE customers (
  customerNumber int   NOT NULL,
  customerName string  NOT NULL,
  contactLastName string   NOT NULL,
  contactFirstName string   NOT NULL,
  phone string  NOT NULL,
  addressLine1 string  NOT NULL,
  addressLine2 string   DEFAULT NULL,
  city string   NOT NULL,
  state string   DEFAULT NULL,
  postalCode string  DEFAULT NULL,
  country string   NOT NULL,
  salesRepEmployeeNumber int   DEFAULT NULL,
  creditLimit float DEFAULT NULL,
  PRIMARY KEY (customerNumber)
);

DROP TABLE employees;
CREATE TABLE employees (
  employeeNumber int   NOT NULL,
  lastName string    NOT NULL,
  firstName string    NOT NULL,
  extension string   NOT NULL,
  email string   NOT NULL,
  officeCode string   NOT NULL,
  reportsTo int   DEFAULT NULL,
  jobTitle string    NOT NULL,
  PRIMARY KEY (employeeNumber)
) ;

DROP TABLE offices;
CREATE TABLE offices (
  officeCode string    NOT NULL,
  city string    NOT NULL,
  phone string    NOT NULL,
  addressLine1 string    NOT NULL,
  addressLine2 string    DEFAULT NULL,
  state string    DEFAULT NULL,
  country string    NOT NULL,
  postalCode string   NOT NULL,
  territory string   NOT NULL,
  PRIMARY KEY (officeCode)
);

DROP TABLE  orderdetails;
CREATE TABLE orderdetails (
  orderNumber int   NOT NULL,
  productCode string    NOT NULL,
  quantityOrdered int   NOT NULL,
  priceEach float NOT NULL,
  orderLineNumber int NOT NULL,
  PRIMARY KEY (orderNumber,productCode)
);

DROP TABLE orders;
CREATE TABLE orders (
  orderNumber int   NOT NULL,
  orderDate string NOT NULL,
  requiredDate string NOT NULL,
  shippedDate string DEFAULT NULL,
  `status` string   NOT NULL,
  comments string  ,
  customerNumber int   NOT NULL,
  PRIMARY KEY (orderNumber)
) ;

DROP TABLE  payments;
CREATE TABLE payments (
  customerNumber int   NOT NULL,
  checkNumber string    NOT NULL,
  paymentDate string NOT NULL,
  amount float NOT NULL,
  PRIMARY KEY (customerNumber,checkNumber)
) ;

DROP TABLE products;
CREATE TABLE products (
  productCode string    NOT NULL,
  productName string  NOT NULL,
  productLine string    NOT NULL,
  productScale string   NOT NULL,
  productVendor string    NOT NULL,
  productDescription text   NOT NULL,
  quantityInStock int NOT NULL,
  buyPrice float NOT NULL,
  MSRP float NOT NULL,
  PRIMARY KEY (productCode)
);


