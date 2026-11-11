-- 13ヶ月より前の注文を orders_archive に移動する
-- 使い方: psql -v cutoff="'2025-10-01'" -f archive_orders.sql
\set ON_ERROR_STOP on

BEGIN;

INSERT INTO orders_archive
SELECT * FROM orders
WHERE created_at < :cutoff;

INSERT INTO order_items_archive
SELECT oi.* FROM order_items oi
JOIN orders o ON o.id = oi.order_id
WHERE o.created_at < :cutoff;

DELETE FROM order_items
WHERE order_id IN (SELECT id FROM orders WHERE created_at < :cutoff);

DELETE FROM orders
WHERE created_at < :cutoff;

COMMIT;
