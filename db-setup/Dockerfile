FROM postgres:latest
ADD postgresql.conf /docker-entrypoint-initdb.d/
ADD 0_update-config.sh /docker-entrypoint-initdb.d/
ADD 1_start-stats.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_PASSWORD=""
ENV POSTGRES_DB="playground"
ENV PGDATA=/data
