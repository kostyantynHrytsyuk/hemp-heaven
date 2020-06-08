-- 1) для агронома A знайти усiх споживачiв, яким вiн продавав продукт хоча б N разiв за
--вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS c_and_a_orders_info CASCADE;

CREATE VIEW c_and_a_orders_info AS
SELECT c.first_name || ' ' || c.last_name AS customer_full_name, a.id 
FROM orders AS o
JOIN agronomists AS a ON a.id = o.agronom_id
JOIN customers AS c ON c.id = o.customer_id
WHERE o.order_date > '2019-01-01' -- (F)
and o.order_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS orders_amount_info CASCADE;

CREATE VIEW orders_amount_info AS
SELECT oi.customer_full_name, oi.id, COUNT(oi.customer_full_name) AS amount
FROM c_and_a_orders_info AS oi
GROUP BY oi.customer_full_name, oi.id
;

SELECT oai.customer_full_name
FROM orders_amount_info AS oai
WHERE oai.id = 5 -- (A.id)
and oai.amount >= 1 -- (N)
;

-- 2)для споживача С знайти усi продукти, якi вiн придбав за вказаний перiод (з дати F по дату T);
DROP VIEW IF EXISTS c_order_info CASCADE;

CREATE VIEW c_order_info AS
SELECT p.prod_name AS p_name, c.id, p.agronom_id 
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > '2019-01-01' -- (F)
and o.order_date < '2020-11-01' -- (T)
;

SELECT DISTINCT coi.p_name
FROM c_order_info AS coi
WHERE coi.id = 2 -- (C.id)
;

-- 3) для споживача С знайти усiх агрономiв, якi проводили для нього дегустацiю хоча б N разiв
--за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id,  ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > '2020-01-01' --(F)
and ts.tasting_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS c_tastings_amount_info CASCADE;

CREATE VIEW c_tastings_amount_info AS
SELECT t.first_name, t.last_name, t.agronom_id, t.customer_id, COUNT(t.agronom_id) AS amount
FROM c_tastings_info AS t
GROUP BY  t.first_name, t.last_name, t.agronom_id, t.customer_id
;

SELECT DISTINCT first_name || ' ' || last_name AS full_name
FROM c_tastings_amount_info AS t
WHERE t.customer_id = 2 --(C.id) 
and t.amount >= 3 --(N)
;

-- 4) для агронома А знайти усiх агрономiв, з якими вiн їздив у вiдрядження протягом вказаного
--перiоду (з дати F по дату T);

DROP VIEW IF EXISTS group_info CASCADE;

CREATE VIEW group_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id, bt_g_m.bt_group_id
FROM agronomists AS a
JOIN bt_group_members AS bt_g_m ON a.id = bt_g_m.agronom_id
JOIN business_trips_groups AS b_t_g ON b_t_g.id = bt_g_m.bt_group_id
JOIN business_trips AS b_t ON b_t_g.id = b_t.bt_group_id
WHERE b_t.start_date > '2020-01-01' -- (F)
and b_t.finish_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS agronom_info CASCADE;

CREATE VIEW agronom_info AS
SELECT bt_group_id AS id
FROM group_info
WHERE agronom_id = 1 -- A.id
;

SELECT DISTINCT a_g.first_name || ' ' || a_g.last_name AS full_name
FROM group_info AS a_g 
JOIN agronom_info AS a_i ON a_g.bt_group_id = a_i.id
WHERE a_g.agronom_id != 1 -- A.id
;

-- 5) для споживача С знайти усiх агрономiв, якi продали йому хоча б щось та провели для нього
--хоча б одну дегустацiю протягом вказаного перiоду (з дати F по дату T);

DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id, ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > '2019-01-01' --(F)
and ts.tasting_date < '2020-11-01' -- (T)
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
WHERE o.order_date > '2019-01-01' -- (F)
and o.order_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS sell_products CASCADE;

CREATE VIEW sell_products AS
SELECT coi.agronom_id AS agronom_id
FROM c_order_info AS coi
JOIN agronomists AS a ON a.id = coi.agronom_id
WHERE coi.id = 2 -- (C.id)
;

DROP VIEW IF EXISTS held_a_tasting CASCADE;

CREATE VIEW held_a_tasting AS
SELECT first_name || ' ' || last_name AS full_name, t.agronom_id
FROM c_tastings_amount_info AS t
WHERE t.customer_id = 2 --(C.id) 
and t.amount >= 1 -- не змінювати, так має бути завжди ;) 
;

SELECT DISTINCT hat.full_name
FROM held_a_tasting AS hat
JOIN sell_products AS sp ON hat.agronom_id = sp.agronom_id 
;

-- 6) знайти усiх споживачiв, якi купили щонайменше N рiзних продуктiв за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS customers_order_info CASCADE;

CREATE VIEW customers_order_info AS
SELECT DISTINCT ON (p.prod_name) p.prod_name AS p_name, c.id, p.agronom_id 
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > '2020-01-01' -- (F)
and o.order_date < '2020-11-01' -- (T)
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
WHERE pai.amount >= 2 --(N)
;
-- 7) знайти усiх агрономiв, якi збирали урожай хоча б N рiзних сортiв коноплi за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS harvest_info CASCADE;

CREATE VIEW harvest_info AS
SELECT a.first_name, a.last_name, h.hemp_sort_id, h.agronom_id 
FROM agronomists AS a
JOIN harvests AS h ON a.id = h.agronom_id
JOIN hemp_sort AS h_s ON h_s.id = h.hemp_sort_id
WHERE h.start_date > '2020-01-01' --(F)
and h.finish_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS hemp_sort_info CASCADE;

CREATE VIEW hemp_sort_info AS
SELECT h.first_name, h.last_name, h.agronom_id, COUNT(DISTINCT h.hemp_sort_id) AS amount
FROM harvest_info AS h
GROUP BY  h.first_name, h.last_name, h.agronom_id
;

SELECT DISTINCT first_name || ' ' || last_name AS full_name
FROM hemp_sort_info AS h
WHERE h.amount >= 3 --(N)
;

-- 8) знайти усi спiльнi дегустацiї для споживача С та агронома А за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS c_tastings_info CASCADE;

CREATE VIEW c_tastings_info AS
SELECT a.first_name, a.last_name, a.id AS agronom_id,  c.id AS customer_id, ts.id
FROM customers AS c
JOIN tasting_group_members AS tgm ON tgm.customer_id = c.id
JOIN tsts_groups AS tsts_g ON tsts_g.id = tgm.tsts_groups_id
JOIN tastings AS ts ON ts.tsts_groups_id = tsts_g.id
JOIN products  AS p ON ts.product_id = p.id
JOIN agronomists AS a ON p.agronom_id = a.id
WHERE ts.tasting_date > '2019-01-01' -- (F)
and ts.tasting_date < '2020-11-01' -- (T)
;

SELECT DISTINCT ti.id
FROM c_tastings_info AS ti
WHERE ti.customer_id = 1 -- (C.id)
and ti.agronom_id = 1 -- (A.id)
;

-- 9) для агронома A та кожного продукту, дегустацiю якого вiн проводив, знайти скiльки разiв
-- за вказаний перiод (з дати F по дату T) вiн проводив дегустацiю для щонайменше N споживачiв;

DROP VIEW IF EXISTS a_tastings_info CASCADE;

CREATE VIEW a_tastings_info AS
SELECT a.id AS agronom_id,  c.id AS customer_id,  ts.id
FROM agronomists AS a
JOIN products  AS p ON p.agronom_id = a.id
JOIN tastings AS ts ON ts.product_id = p.id
JOIN tsts_groups AS tsts_g ON ts.tsts_groups_id = tsts_g.id
JOIN tasting_group_members AS tgm ON tsts_g.id = tgm.tsts_groups_id
JOIN customers AS c ON tgm.customer_id = c.id
WHERE ts.tasting_date > '2020-01-01' --(F)
and ts.tasting_date < '2020-11-01' -- (T)
;

DROP VIEW IF EXISTS a_tastings_amount_info CASCADE;

CREATE VIEW a_tastings_amount_info AS
SELECT t.agronom_id, COUNT(t.agronom_id) AS amount, t.id
FROM a_tastings_info AS t
GROUP BY  t.agronom_id, t.id
;

SELECT COUNT(*)
FROM a_tastings_amount_info AS t
WHERE t.agronom_id = 1 -- (A.id)
and t.amount >= 7 --(N)
;

-- 10) для споживача С знайти сумарну кiлькiсть вiдгукiв по мiсяцях, якi вiн залишив за вказаний
-- перiод (з дати F по дату T);

DROP VIEW IF EXISTS all_complaints CASCADE; 

CREATE VIEW all_complaints AS
SELECT EXTRACT(MONTH FROM comp_date) AS c_month
FROM complaints
WHERE customer_id = 6 --(C.id)
and comp_date >= '2019-01-01' -- (F)
and comp_date <= '2020-10-30' -- (T)
;

SELECT  ac.c_month AS Month, COUNT(ac.c_month) AS amount
FROM all_complaints AS ac
GROUP BY ac.c_month
;

-- 11) вивести сорти коноплi у порядку спадання середньої кiлькостi вiдряджень, у якi їздили
--агрономи, що збирали його урожай хоча б N разiв за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS hemp_harvest_info CASCADE;

CREATE VIEW hemp_harvest_info AS
SELECT h.hemp_sort_id, h.agronom_id
FROM agronomists AS a
JOIN harvests AS h ON a.id = h.agronom_id
WHERE  h.start_date > '2020-01-01' -- (F)
and h.finish_date < '2020-11-01' -- (T)
;
DROP VIEW IF EXISTS harvest_amount_info CASCADE;

CREATE VIEW harvest_amount_info AS
SELECT hi.agronom_id, COUNT(hi.agronom_id) AS amount
FROM hemp_harvest_info AS hi
GROUP BY hi.agronom_id
;



-- 12) вивести продукти, якi були придбанi щонайменше N рiзними споживачами у порядку спадання вiдсотку
-- повернень за вказаний перiод (з дати F по дату T);

DROP VIEW IF EXISTS p_orders_info CASCADE;

CREATE VIEW p_orders_info AS
SELECT p.prod_name AS p_name, o.customer_id, p.id
FROM orders AS o
JOIN order_items AS oi ON o.id = oi.order_id
JOIN products AS p ON oi.product_id = p.id
WHERE o.order_date > '2019-01-01' -- (F)
and o.order_date < '2020-11-01' -- (T)
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
WHERE aoc.amount >= 3 -- (N)
;

DROP VIEW IF EXISTS return_info CASCADE;

CREATE VIEW return_info AS
SELECT pi.id, r.return_date
FROM product_info AS pi
JOIN order_items AS oi ON oi.product_id = pi.id
JOIN orders AS o ON oi.order_id = o.id
LEFT JOIN returnss AS r ON r.order_id = o.id
WHERE r.return_date > '2019-01-01' --(F)
and r.return_date < '2020-11-01' --(T)
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

