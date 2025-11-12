CREATE TABLE `manufacturer` (
    `manufacturer_id` INT NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(255) NOT NULL,
    `country`         VARCHAR(255) NOT NULL,
    PRIMARY KEY (`manufacturer_id`)
);
CREATE TABLE `medicine` (
    `medicine_id`                  INT NOT NULL AUTO_INCREMENT,
    `name`                         VARCHAR(255) NOT NULL,
    `base_price`                   	DECIMAL(10, 2) NOT NULL,
    `manufacturer_manufacturer_id` INT NOT NULL,
    PRIMARY KEY (`medicine_id`),
    FOREIGN KEY (`manufacturer_manufacturer_id`) REFERENCES `manufacturer`(`manufacturer_id`)
);
CREATE TABLE `sale` (
    `sale_id`      INT NOT NULL AUTO_INCREMENT,
    `sale_date`    DATE NOT NULL,
    `total_amount` INT,
    PRIMARY KEY (`sale_id`)
);
CREATE TABLE `saleitem` (
    `sale_item_id` INT NOT NULL AUTO_INCREMENT,
    `qty`          INT,
    `unit_price`   DECIMAL(10, 2),
    `sale_sale_id` INT NOT NULL,
    PRIMARY KEY (`sale_item_id`),
    FOREIGN KEY (`sale_sale_id`) REFERENCES `sale`(`sale_id`)
);
CREATE TABLE `supplier` (
    `supplier_id` INT NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(255),
	PRIMARY KEY (`supplier_id`)
);
CREATE TABLE `supply` (
    `supply_id`            INT NOT NULL AUTO_INCREMENT,
    `supply_date`          DATE,
    `total_amount`         INT,
    `supplier_supplier_id` INT NOT NULL,
	PRIMARY KEY (`supply_id`),
    FOREIGN KEY (`supplier_supplier_id`) REFERENCES `supplier`(`supplier_id`)
);
CREATE TABLE `supplyitem` (
    `supply_item_id`    INT NOT NULL AUTO_INCREMENT,
    `qty`              INT,
    `supply_supply_id` INT NOT NULL,
    	PRIMARY KEY (`supply_item_id`),
        FOREIGN KEY (`supply_supply_id`) REFERENCES `supply`(`supply_id`)
);
CREATE TABLE `batch` (
    `batch_id`                INT NOT NULL AUTO_INCREMENT,    
    `batch_number`             VARCHAR(255),   
    `expiry_date`              DATE,
    `qty_received`              INT,
    `medicine_medicine_id`    INT NOT NULL,
    `supplyitem_upply_item_id` INT NOT NULL,
    `saleitem_sale_item_id`    INT NOT NULL,
    PRIMARY KEY (`batch_id`),
FOREIGN KEY (`medicine_medicine_id`) REFERENCES `medicines`(`medicine_id`),
FOREIGN KEY (`supplyitem_upply_item_id`) REFERENCES `supplyitem`(`supply_item_id`),
FOREIGN KEY (`saleitem_sale_item_id`) REFERENCES `saleitem`(`sale_item_id`)
);