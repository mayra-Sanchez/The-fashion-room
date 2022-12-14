CREATE OR REPLACE FUNCTION create_invoice_id()
	RETURNS INTEGER AS
	$BODY$
	DECLARE
		inv_id INTEGER;
	BEGIN
		PERFORM nextval('invoice_id_seq');
		SELECT invoice_id_seq.last_value INTO inv_id FROM invoice_id_seq;
	RETURN inv_id;
	END;
	$BODY$
	LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION create_invoice(inv_id INTEGER, cust_id INTEGER)
	RETURNS void AS
	$BODY$
	DECLARE
		pur_date DATE;
	BEGIN
		pur_date := NOW()::DATE;
		INSERT INTO invoice (invoice_id, customer_id, purchase_date) VALUES (inv_id, cust_id, pur_date);
	END;
	$BODY$
	LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION invoice_data(inv_id INTEGER, prod_id INTEGER, quant INTEGER, amount INTEGER)
    RETURNS void AS
    $BODY$
    BEGIN
        INSERT INTO invoice_detail (invoice_id, product_id, quantity, total_amount) VALUES (inv_id, prod_id, quant, amount);
    END;
    $BODY$
    LANGUAGE plpgsql;

CREATE TABLE product (
    product_id INTEGER,
    product_name VARCHAR(25) NOT NULL,
    price INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (product_id)
);

CREATE SEQUENCE product_product_id_seq
    START WITH 656589
    INCREMENT BY 215
    OWNED BY product.product_id;

INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Blusa', 45000, 100);
INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Camisa', 40000, 100);
INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Corbata', 20000, 100);
INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Pantalon', 65000, 100);
INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Pantaloneta', 30000, 100);
INSERT INTO product (product_id, product_name, price, stock) VALUES (nextval('product_product_id_seq'), 'Zapatos', 90000, 100);

CREATE TABLE customer (
    customer_id SERIAL,
    name VARCHAR(25) NOT NULL,
    lastname VARCHAR(25),
    email VARCHAR(40) UNIQUE NOT NULL,
    password VARCHAR(30) NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE invoice (
    invoice_id INTEGER,
    customer_id INTEGER NOT NULL,
    purchase_date DATE NOT NULL,
    CONSTRAINT pk_invoice PRIMARY KEY (invoice_id),
    CONSTRAINT fk_invoice_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE SEQUENCE invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    OWNED BY invoice.invoice_id;

CREATE TABLE invoice_detail (
    invoice_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    total_amount INTEGER NOT NULL,
    CONSTRAINT fk_invoice_detail_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    CONSTRAINT fk_invoice_detail_product_id FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE store (
    nit INTEGER,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL,
    CONSTRAINT pk_store PRIMARY KEY (nit)
);

CREATE SEQUENCE nit_seq
    START WITH 2020
    INCREMENT BY 1
    OWNED BY store.nit;

INSERT INTO store (nit, name, address) VALUES (nextval('nit_seq'), 'THE FASHION ROOM SUR', 'CR 29B N 325-4');
INSERT INTO store (nit, name, address) VALUES (nextval('nit_seq'), 'THE FASHION ROOM NORTE', 'CR 100 N110-2');
INSERT INTO store (nit, name, address) VALUES (nextval('nit_seq'), 'THE FASHION ROOM ORIENTE', 'CR 5 N20-12');
INSERT INTO store (nit, name, address) VALUES (nextval('nit_seq'), 'THE FASHION ROOM OCCIDENTE', 'CR 5 N1-2');
INSERT INTO store (nit, name, address) VALUES (nextval('nit_seq'), 'THE FASHION ROOM SUROCCIDENTE', 'CR 7 N56-32');

CREATE TABLE store_phone (
    nit INTEGER,
    phone BIGINT NOT NULL,
    CONSTRAINT pk_store_phone PRIMARY KEY (nit),
    CONSTRAINT fk_store_phone FOREIGN KEY (nit) REFERENCES store(nit)
);

INSERT INTO store_phone (nit, phone) VALUES (2020, 4225136);
INSERT INTO store_phone (nit, phone) VALUES (2021, 4225136);
INSERT INTO store_phone (nit, phone) VALUES (2022, 4218755);
INSERT INTO store_phone (nit, phone) VALUES (2023, 4856923);
INSERT INTO store_phone (nit, phone) VALUES (2024, 4128745);
