#!/usr/bin/env bash
# 月次アーカイブ実行
# usage: ./run_archive.sh [cutoff_date]   (省略時は13ヶ月前の月初)
set -euo pipefail

DB_HOST="${DB_HOST:-orders-db-prod.internal}"
DB_NAME="${DB_NAME:-orders}"
DB_USER="${DB_USER:-maint}"

CUTOFF="${1:-$(date -d "$(date +%Y-%m-01) -13 months" +%Y-%m-%d)}"

echo "cutoff = ${CUTOFF}"
read -r -p "続行しますか? [y/N] " ans
[[ "$ans" == "y" ]] || exit 1

psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" \
  -v cutoff="'${CUTOFF}'" \
  -f "$(dirname "$0")/archive_orders.sql"

psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -c "VACUUM ANALYZE orders; VACUUM ANALYZE order_items;"
echo "done"
