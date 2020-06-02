-- Database: kannabis

-- DROP DATABASE kannabis;

CREATE DATABASE kannabis;
  

CREATE TABLE agronomists(
	id serial NOT NULL unique,
	last_name VARCHAR (255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE customers(
	id serial NOT NULL unique,
	last_name VARCHAR (255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE hemp_sort(
	id serial NOT NULL unique,
	PRIMARY KEY (id),
	sort_name VARCHAR(255) NOT NULL
);

CREATE TABLE complaints(
	id serial NOT NULL unique,
	customer_id integer  not null,
	text_complaints VARCHAR NOT NULL,
	comp_date date not null,
	PRIMARY KEY (id),
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);
create index record_date on complaints using brin (comp_date);

CREATE TABLE products(
	id serial NOT NULL unique,
	prod_name VARCHAR(255) NOT NULL UNIQUE,
	agronom_id integer NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(agronom_id) REFERENCES agronomists(id)
);

CREATE TABLE product_items(
	product_id integer NOT NULL,
	hemp_id integer  not null,
	FOREIGN KEY(hemp_id) REFERENCES hemp_sort(id),
	FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE orders(
	id serial NOT NULL unique,
	customer_id integer  not null,
	agronom_id integer NOT NULL,
	order_date date not null,
	PRIMARY KEY (id),
	FOREIGN KEY(customer_id) REFERENCES customers(id),
	FOREIGN KEY(agronom_id) REFERENCES agronomists(id)
	--? status 
);
create index place_date on orders using brin (order_date);



CREATE TABLE order_items(
	order_id integer  not null,
	product_id integer NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE status(
	id serial NOT NULL unique,
	PRIMARY KEY (id),
	status_name VARCHAR(255) NOT NULL
);

CREATE TABLE returnss(
	id serial NOT NULL unique,
	order_id integer  not null,
	customer_id integer NOT NULL,
	status_id integer NOT NULL,
	return_date date not null,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	FOREIGN KEY(customer_id) REFERENCES customers(id),
	FOREIGN KEY(status_id) REFERENCES status(id),
	PRIMARY KEY (id)
);
create index post_date on returnss using brin (return_date);

CREATE TABLE harvests(
	id serial NOT NULL unique,
	agronom_id integer NOT NULL,
	hemp_sort_id integer NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(agronom_id) REFERENCES agronomists(id),
	FOREIGN KEY(hemp_sort_id) REFERENCES hemp_sort(id),
	start_date date not null,
	finish_date date not null
);

create index har_start_date on harvests using brin (start_date);
create index har_finish_date on harvests using brin (finish_date);

CREATE TABLE tsts_groups(
	id serial NOT NULL unique,
	PRIMARY KEY (id),
	title VARCHAR(255) NOT NULL
);

CREATE TABLE tasting_group_members(
	tsts_groups_id integer NOT NULL,
	customer_id integer NOT NULL,
	FOREIGN KEY(tsts_groups_id) REFERENCES tsts_groups(id),
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);


CREATE TABLE tastings(
	id serial NOT NULL unique,
	PRIMARY KEY (id),
	tsts_groups_id integer NOT NULL,
	product_id integer NOT NULL,
	FOREIGN KEY(tsts_groups_id) REFERENCES tsts_groups(id),
	FOREIGN KEY(product_id) REFERENCES products(id),
	tasting_date date not null
);
create index event_date on tastings using brin (tasting_date);

CREATE TABLE business_trips_groups(
	id serial NOT NULL unique,
	PRIMARY KEY (id),
	title VARCHAR(255) NOT NULL
);

CREATE TABLE bt_group_members(
	bt_group_id integer NOT NULL,
	agronom_id integer NOT NULL,
	FOREIGN KEY(agronom_id) REFERENCES agronomists(id),
	FOREIGN KEY(bt_group_id) REFERENCES business_trips_groups(id)
);

CREATE TABLE business_trips(
	id serial NOT NULL unique,
	bt_group_id integer NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(bt_group_id) REFERENCES business_trips_groups(id),
	start_date date not null,
	finish_date date not null
);
create index bt_start_date on business_trips using brin (start_date);
create index bt_finish_date on business_trips using brin (finish_date);





