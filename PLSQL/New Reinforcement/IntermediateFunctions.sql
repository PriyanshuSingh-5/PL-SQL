2)Create a stored function to calculate the total number of days between two dates for all orders placed by a customer

CREATE TABLE orderDetailsDemo (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  order_date DATE,
  ship_date DATE,
  CONSTRAINT orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customersdata (customer_id)
);

insert into orderDetailsDemo(order_id,customer_id,order_date,ship_date)values(3,3,TO_DATE('2022-10-01', 'YYYY-MM-DD'),TO_DATE('2022-10-04', 'YYYY-MM-DD'))
CREATE TABLE customersdata (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    address VARCHAR2(50),
    city VARCHAR2(50),
    state VARCHAR2(50),
    country VARCHAR2(50),
    postal_code VARCHAR2(50)
);


CREATE OR REPLACE FUNCTION calculate_order_days(
  p_customer_id IN orderDetailsDemo.customer_id%TYPE,
  p_start_date IN orderDetailsDemo.order_date%TYPE,
  p_end_date IN orderDetailsDemo.order_date%TYPE
)
RETURN NUMBER
IS
  v_total_days NUMBER := 0;
BEGIN
  SELECT SUM(p_end_date - p_start_date + 1)
    INTO v_total_days
    FROM orderDetailsDemo
   WHERE customer_id = p_customer_id
     AND order_date BETWEEN p_start_date AND p_end_date;
     
  RETURN v_total_days;
END;


SELECT calculate_order_days(1, TO_DATE('01-June-2022', 'DD-MON-YYYY'), TO_DATE('31-DEC-2022', 'DD-MON-YYYY'))
FROM dual;