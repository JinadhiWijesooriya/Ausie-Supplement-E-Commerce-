#!/bin/sh
set -e

echo "--> Checking database connection..."
python << 'EOF'
import sys
import time
import os

db_url = os.environ.get("DATABASE_URL", "")
if "postgres" in db_url:
    try:
        import dj_database_url
        import psycopg2
        cfg = dj_database_url.parse(db_url)
        retries = 30
        while retries > 0:
            try:
                conn = psycopg2.connect(
                    dbname=cfg.get('NAME'),
                    user=cfg.get('USER'),
                    password=cfg.get('PASSWORD'),
                    host=cfg.get('HOST', 'db'),
                    port=cfg.get('PORT', 5432),
                    connect_timeout=2
                )
                conn.close()
                print("--> PostgreSQL database is ready!")
                break
            except Exception as e:
                retries -= 1
                time.sleep(1)
        if retries == 0:
            print("--> WARNING: Timed out waiting for PostgreSQL.")
            sys.exit(1)
    except Exception as err:
        print(f"--> Database check error: {err}")
EOF

echo "--> Running database migrations..."
python manage.py migrate --noinput

echo "--> Collecting static files..."
python manage.py collectstatic --noinput --clear || true

echo "--> Starting backend server..."
exec "$@"
