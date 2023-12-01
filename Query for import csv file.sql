DROP SCHEMA IF EXISTS project_2;
CREATE SCHEMA Project_2;

### Create a short table with some columns
CREATE TABLE shopping_trends (
    Customer_ID INT,
    Age INT,
    Gender VARCHAR(10),
    Item_Purchased VARCHAR(50),
    Category VARCHAR(50),
    Purchase_Amount_USD INT,
    Location VARCHAR(50),
    Review_Rating DECIMAL(3,1),
    Previous_Purchases INT
);
### Add columns first time
ALTER TABLE shopping_trends
ADD Size VARCHAR(5),
ADD Color VARCHAR(20),
ADD Season VARCHAR(20);

### Add columns second time
ALTER TABLE shopping_trends
ADD Subscription_Status VARCHAR(10),
ADD Shipping_Type VARCHAR(50),
ADD Discount_Applied VARCHAR(10),
ADD Promo_Code_Used VARCHAR(10),
ADD Payment_Method VARCHAR(20),
ADD Frequency_of_Purchases VARCHAR(20);

### Check new table
SELECT * FROM shopping_trends;
SELECT * FROM shopping_trends_updated;
