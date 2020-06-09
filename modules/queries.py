from sqlalchemy import create_engine, MetaData, Table, text
from datetime import datetime


def create_engn(login, password, host, db):
    url = 'postgresql://' + login + ':' + password + '@' + host + '/' + db

    engine = create_engine(url)

    return engine


# Дістає екземпляр Table з бази відповідно до назви таблички table
def get_table(engine, table):
    meta = MetaData(engine)
    table_obj = Table(table, meta, autoload=True)

    return table_obj


# Додає рядок до таблички, автоматично заповнюючи id. В items id передавати не потрібно.
def add_row(engine, table, items):
    with engine.connect() as connection:
        with connection.begin():
            columns = table.columns.keys()
            if len(items) == len(columns):
                # Якщо в табличці немає колонки id.
                connection.execute(table.insert(), {columns[i]: items[i] for i in range(len(items))})
            elif len(items) == len(columns) - 1:
                # Якщо в табличці є id.
                connection.execute(table.insert(), {columns[i+1]: items[i] for i in range(len(items))})
            else:
                return 'Wrong input'


# Поки не використовується.
def delete_row(engine, table, column, statement):
    if statement.upper() != 'NULL':
        engine.execute('DELETE FROM ' + table + ' WHERE ' + column + ' = ' + str(statement))
    else:
        engine.execute('DELETE FROM ' + table + ' WHERE ' + column + ' IS ' + statement)


# Додає рядок до harvests з вхідими agronom_id, hemp_sort_id, start_date, finish_date.
def event_make_harvest(engine, agronom_id, hemp_sort_id, start_date, finish_date):
    tbl = get_table(engine, 'harvests')
    items = [agronom_id, hemp_sort_id, start_date, finish_date]
    add_row(engine, tbl, items)

    return 'Success'


# Додає рядок до tastings з вхідими tst_group_id, product_id, tasting_date.
def event_make_tasting(engine, tst_group_id, product_id, tasting_date):
    tbl = get_table(engine, 'tastings')
    items = [tst_group_id, product_id, tasting_date]
    add_row(engine, tbl, items)

    return 'Success'


# Додає рядок до orders з вхідними customer_id, agronom_id, order_date. Бере останній доданий id ордера і додає рядок в
# табличку order_items рядки з останнім order_id та всіма product_id, що є в product_id_list.
def event_make_purchase(engine, customer_id, agronom_id, order_date, product_id_list):
    tbl = get_table(engine, 'orders')
    items = [customer_id, agronom_id, order_date]
    add_row(engine, tbl, items)

    r = engine.execute('select max(id) from orders')
    current_order_id = r.fetchone()[0]

    tbl_ord_items = get_table(engine, 'order_items')
    for product_id in product_id_list:
        items_ord_items = [current_order_id, product_id]
        add_row(engine, tbl_ord_items, items_ord_items)

    return 'Success'


# Додає рядок до returnss з вхідими order_id, status_id, return_date, якщо пройшло менше 15 днів з моменту замовлення.
# Приклад формату return_date: '2020-06-21.'
def event_return_ordered_items(engine, order_id, status_id, return_date):
    tbl = get_table(engine, 'returnss')
    items = [order_id, status_id, return_date]

    r = engine.execute('select order_date from orders where id = ' + str(order_id))
    order_date = r.fetchone()[0]

    d1 = datetime.strptime(str(order_date), "%Y-%m-%d")
    d2 = datetime.strptime(str(return_date), "%Y-%m-%d")
    days_passed = (d2 - d1).days

    if 0 <= days_passed <= 14:
        return 'Wrong date'
    else:
        add_row(engine, tbl, items)
        return 'Success'


# Додає рядок до business_trips з вхідими bt_group_id, start_date, finish_date.
def event_make_business_trips(engine, bt_group_id, start_date, finish_date):
    tbl = get_table(engine, 'business_trips')
    items = [bt_group_id, start_date, finish_date]
    add_row(engine, tbl, items)

    return 'Success'


# Додає рядок до complaints з вхідими customer_id, comp_text, copm_date.
def event_make_complain(engine, customer_id, comp_text, copm_date):
    tbl = get_table(engine, 'complaints')
    items = [customer_id, comp_text, copm_date]
    add_row(engine, tbl, items)

    return 'Success'


# Поки не використовується.
def make_select(engine, select):
    return engine.execute(select)


def make_select1(engine, agronom_a, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS c_and_a_orders_info CASCADE;

CREATE VIEW c_and_a_orders_info AS
SELECT c.first_name || ' ' || c.last_name AS customer_full_name, a.id 
FROM orders AS o
JOIN agronomists AS a ON a.id = o.agronom_id
JOIN customers AS c ON c.id = o.customer_id
WHERE o.order_date > ''' + date_f + '''
and o.order_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS orders_amount_info CASCADE;

CREATE VIEW orders_amount_info AS
SELECT oi.customer_full_name, oi.id, COUNT(oi.customer_full_name) AS amount
FROM c_and_a_orders_info AS oi
GROUP BY oi.customer_full_name, oi.id
;

SELECT oai.customer_full_name
FROM orders_amount_info AS oai
WHERE oai.id = ''' + agronom_a + '''
and oai.amount >= ''' + amount_n + '''
;'''

    return engine.execute(select)


def make_select2(engine, customer_id, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS c_order_info CASCADE;

CREATE VIEW c_order_info AS
SELECT p.prod_name AS p_name, c.id, p.agronom_id 
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > ''' + date_f + '''
and o.order_date < ''' + date_t + '''
;

SELECT DISTINCT coi.p_name
FROM c_order_info AS coi
WHERE coi.id = ''' + customer_id + '''
;'''

    return engine.execute(select)


def make_select3(engine, customer_id, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id,  ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > ''' + date_f + '''
and ts.tasting_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS c_tastings_amount_info CASCADE;

CREATE VIEW c_tastings_amount_info AS
SELECT t.first_name, t.last_name, t.agronom_id, t.customer_id, COUNT(t.agronom_id) AS amount
FROM c_tastings_info AS t
GROUP BY  t.first_name, t.last_name, t.agronom_id, t.customer_id
;

SELECT DISTINCT first_name || ' ' || last_name AS full_name
FROM c_tastings_amount_info AS t
WHERE t.customer_id = ''' + customer_id + '''
and t.amount >= ''' + amount_n + '''
;'''

    return engine.execute(select)


def make_select4(engine, agronom_id, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS group_info CASCADE;

CREATE VIEW group_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id, bt_g_m.bt_group_id
FROM agronomists AS a
JOIN bt_group_members AS bt_g_m ON a.id = bt_g_m.agronom_id
JOIN business_trips_groups AS b_t_g ON b_t_g.id = bt_g_m.bt_group_id
JOIN business_trips AS b_t ON b_t_g.id = b_t.bt_group_id
WHERE b_t.start_date > ''' + date_f + '''
and b_t.finish_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS agronom_info CASCADE;

CREATE VIEW agronom_info AS
SELECT bt_group_id AS id
FROM group_info
WHERE agronom_id = ''' + agronom_id + '''
;

SELECT DISTINCT a_g.first_name || ' ' || a_g.last_name AS full_name
FROM group_info AS a_g 
JOIN agronom_info AS a_i ON a_g.bt_group_id = a_i.id
WHERE a_g.agronom_id != ''' + agronom_id + '''
;'''

    return engine.execute(select)


def make_select5(engine, customer_id, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id, ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > ''' + date_f + '''
and ts.tasting_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS c_tastings_amount_info CASCADE;

CREATE VIEW c_tastings_amount_info AS
SELECT t.first_name, t.last_name, t.agronom_id, t.customer_id, COUNT(t.agronom_id) AS amount
FROM c_tastings_info AS t
GROUP BY  t.first_name, t.last_name, t.agronom_id, t.customer_id
;

DROP VIEW IF EXISTS c_order_info CASCADE;

CREATE VIEW c_order_info AS
SELECT p.prod_name AS p_name, c.id, p.agronom_id 
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > ''' + date_f + '''
and o.order_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS sell_products CASCADE;

CREATE VIEW sell_products AS
SELECT coi.agronom_id AS agronom_id
FROM c_order_info AS coi
JOIN agronomists AS a ON a.id = coi.agronom_id
WHERE coi.id = ''' + customer_id + '''
;

DROP VIEW IF EXISTS held_a_tasting CASCADE;

CREATE VIEW held_a_tasting AS
SELECT first_name || ' ' || last_name AS full_name, t.agronom_id
FROM c_tastings_amount_info AS t
WHERE t.customer_id = ''' + customer_id + '''
and t.amount >= 1 -- не змінювати, так має бути завжди ;) 
;

SELECT DISTINCT hat.full_name
FROM held_a_tasting AS hat
JOIN sell_products AS sp ON hat.agronom_id = sp.agronom_id 
;
'''

    return engine.execute(select)


def make_select6(engine, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS customers_order_info CASCADE;

CREATE VIEW customers_order_info AS
SELECT DISTINCT ON (p.prod_name) p.prod_name AS p_name, c.id, p.agronom_id 
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > ''' + date_f + '''
and o.order_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS products_amount_info CASCADE;

CREATE VIEW products_amount_info AS
SELECT coi.id AS customer_id, COUNT(coi.id) AS amount
FROM customers_order_info AS coi
GROUP BY coi.id
;

SELECT DISTINCT c.first_name || ' ' || c.last_name AS full_name
FROM products_amount_info AS pai
JOIN customers AS c ON pai.customer_id = c.id
WHERE pai.amount >= ''' + amount_n + '''
;'''

    return engine.execute(select)


def make_select7(engine, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS harvest_info CASCADE;

CREATE VIEW harvest_info AS
SELECT a.first_name, a.last_name, h.hemp_sort_id, h.agronom_id 
FROM agronomists AS a
JOIN harvests AS h ON a.id = h.agronom_id
JOIN hemp_sort AS h_s ON h_s.id = h.hemp_sort_id
WHERE h.start_date > ''' + date_f + '''
and h.finish_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS hemp_sort_info CASCADE;

CREATE VIEW hemp_sort_info AS
SELECT h.first_name, h.last_name, h.agronom_id, COUNT(DISTINCT h.hemp_sort_id) AS amount
FROM harvest_info AS h
GROUP BY  h.first_name, h.last_name, h.agronom_id
;

SELECT DISTINCT first_name || ' ' || last_name AS full_name
FROM hemp_sort_info AS h
WHERE h.amount >= ''' + amount_n + '''
;'''

    return engine.execute(select)


def make_select8(engine, customer_id, agronom_id, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id, ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > ''' + date_f + '''
and ts.tasting_date < ''' + date_t + '''
;

SELECT DISTINCT ti.id
FROM c_tastings_info AS ti
WHERE ti.customer_id = ''' + customer_id + '''
and ti.agronom_id = ''' + agronom_id + '''
;
'''

    return engine.execute(select)


def make_select9(engine, agronom_id, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS a_tastings_info CASCADE;

CREATE VIEW a_tastings_info AS
SELECT a.id AS agronom_id,  c.id AS customer_id,  ts.id
FROM agronomists AS a
JOIN products  AS p ON p.agronom_id = a.id
JOIN tastings AS ts ON ts.product_id = p.id
JOIN tsts_groups AS tsts_g ON ts.tsts_groups_id = tsts_g.id
JOIN tasting_group_members AS tgm ON tsts_g.id = tgm.tsts_groups_id
JOIN customers AS c ON tgm.customer_id = c.id
WHERE ts.tasting_date > ''' + date_f + '''
and ts.tasting_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS a_tastings_amount_info CASCADE;

CREATE VIEW a_tastings_amount_info AS
SELECT t.agronom_id, COUNT(t.agronom_id) AS amount, t.id
FROM a_tastings_info AS t
GROUP BY  t.agronom_id, t.id
;

SELECT COUNT(*)
FROM a_tastings_amount_info AS t
WHERE t.agronom_id = ''' + agronom_id + '''
and t.amount >= ''' + amount_n + '''
;'''

    return engine.execute(select)


def make_select10(engine, customer_id, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS all_complaints CASCADE; 

CREATE VIEW all_complaints AS
SELECT EXTRACT(MONTH FROM comp_date) AS c_month
FROM complaints
WHERE customer_id = ''' + customer_id + '''
and comp_date >= ''' + date_f + '''
and comp_date <= ''' + date_t + '''
;

SELECT  ac.c_month AS Month, COUNT(ac.c_month) AS amount
FROM all_complaints AS ac
GROUP BY ac.c_month
;'''

    return engine.execute(select)


def make_select11(engine, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS hemp_harvest_info CASCADE;

CREATE VIEW hemp_harvest_info AS
SELECT h.hemp_sort_id, h.agronom_id
FROM agronomists AS a
JOIN harvests AS h ON a.id = h.agronom_id
WHERE  h.start_date > ''' + date_f + '''
and h.finish_date < ''' + date_t + '''
;
DROP VIEW IF EXISTS harvest_amount_info CASCADE;

CREATE VIEW harvest_amount_info AS
SELECT hi.agronom_id, COUNT(hi.agronom_id) AS amount
FROM hemp_harvest_info AS hi
GROUP BY hi.agronom_id
;

DROP VIEW IF EXISTS hardworking_agronomists CASCADE;

CREATE VIEW hardworking_agronomists AS
SELECT hai.agronom_id
FROM harvest_amount_info AS hai
WHERE hai.amount >= ''' + amount_n + '''
;

DROP VIEW IF EXISTS business_trips_info CASCADE;

CREATE VIEW business_trips_info AS
SELECT ha.agronom_id, b_t.start_date
FROM hardworking_agronomists AS ha
LEFT JOIN bt_group_members AS bt_g_m ON ha.agronom_id = bt_g_m.agronom_id
RIGHT JOIN business_trips_groups AS b_t_g ON b_t_g.id = bt_g_m.bt_group_id
LEFT JOIN business_trips AS b_t ON b_t_g.id = b_t.bt_group_id
WHERE b_t.start_date > ''' + date_f + '''
and b_t.finish_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS amount_of_business_trips CASCADE;

CREATE VIEW amount_of_business_trips AS
SELECT bti.agronom_id,  SUM (CASE WHEN bti.start_date IS NOT NULL THEN 1 ELSE 0 END) AS amount
FROM business_trips_info AS bti
GROUP BY bti.agronom_id;

DROP VIEW IF EXISTS average_for_hemp CASCADE;

CREATE VIEW average_for_hemp AS
SELECT hi.hemp_sort_id, ROUND(AVG(aobt.amount), 2) AS average
FROM hemp_harvest_info AS hi
RIGHT JOIN amount_of_business_trips AS aobt ON hi.agronom_id = aobt.agronom_id 
GROUP BY hi.hemp_sort_id;

SELECT hs.sort_name
FROM hemp_sort AS hs
RIGHT JOIN average_for_hemp AS aoh ON aoh.hemp_sort_id = hs.id
ORDER BY aoh.average DESC, hs.id;'''

    return engine.execute(select)


def make_select12(engine, amount_n, date_f, date_t):
    select = '''
DROP VIEW IF EXISTS p_orders_info CASCADE;

CREATE VIEW p_orders_info AS
SELECT p.prod_name AS p_name, o.customer_id, p.id
FROM orders AS o
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > ''' + date_f + '''
and o.order_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS amount_of_customers CASCADE;

CREATE VIEW amount_of_customers AS
SELECT poi.p_name, COUNT(poi.p_name) AS amount, poi.id
FROM p_orders_info AS poi
GROUP BY poi.p_name, poi.id;

DROP VIEW IF EXISTS product_info CASCADE;

CREATE VIEW product_info AS
SELECT aoc.p_name, aoc.id
FROM amount_of_customers AS aoc
WHERE aoc.amount >= ''' + amount_n + '''
;

DROP VIEW IF EXISTS return_info CASCADE;

CREATE VIEW return_info AS
SELECT pi.id, r.return_date
FROM product_info AS pi
JOIN order_items AS oi ON oi.product_id = pi.id
JOIN orders AS o ON oi.order_id = o.id
LEFT JOIN returnss AS r ON r.order_id = o.id
WHERE r.return_date > ''' + date_f + '''
and r.return_date < ''' + date_t + '''
;

DROP VIEW IF EXISTS amount_of_returns CASCADE;

CREATE VIEW amount_of_returns AS
SELECT ri.id, SUM (CASE WHEN ri.return_date IS NOT NULL THEN 1 ELSE 0 END) AS amount 
FROM return_info AS ri
GROUP BY ri.id;


SELECT pi.p_name
FROM product_info AS pi 
LEFT JOIN amount_of_returns AS aor ON pi.id = aor.id
ORDER BY aor.amount DESC, pi.id;
'''

    return engine.execute(select)


# Testing
def main():
    engn = create_engn('postgres', 'student', 'localhost', 'hemp')

    # r = make_select1(engn, '5', '1', "'2019-01-01'", "'2020-11-01'")
    # r = make_select2(engn, '2', "'2019-01-01'", "'2020-11-01'")
    # r = make_select3(engn, '2', '3', "'2020-01-01'", "'2020-11-01'")
    # r = make_select4(engn, '1', "'2020-01-01'", "'2020-11-01'")
    # r = make_select5(engn, '2', "'2019-01-01'", "'2020-11-01'")
    # r = make_select6(engn, '2', "'2020-01-01'", "'2020-11-01'")
    # r = make_select7(engn, '3', "'2020-01-01'", "'2020-11-01'")
    # r = make_select8(engn, '1', '1', "'2019-01-01'", "'2020-11-01'")
    # r = make_select9(engn, '1', '7', "'2020-01-01'", "'2020-11-01'")
    # r = make_select10(engn, '6', "'2019-01-01'", "'2020-11-01'")
    # r = make_select11(engn, '3', "'2020-01-01'", "'2020-11-01'")
    r = make_select12(engn, '3', "'2019-01-01'", "'2020-11-01'")

    for item in r:
        print(item)

    # event_make_harvest(engn, 7, 1, '24/06/2019', '21/09/2019')
    # event_make_tasting(engn, 13, 13, '21/09/2019')
    # event_make_purchase(engn, 13, 13, '21/09/2019', [5, 7, 10])
    # event_return_ordered_items(engn, 100, 4, '2020-06-21')
    # event_make_business_trips(engn, 1, '2020-06-21', '2020-07-21')
    # event_make_complain(engn, 3, 'Noice', '2020-06-21')
