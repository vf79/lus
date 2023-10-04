-- POSTGRES

-- Kil Session
    select pg_terminate_backend(pid)
    from pg_stat_activity
    where pid <> pg_backend_pid()
    -- don't kill the connections to other databases
    and datname = '<DATABASE_NAME>';

-- List Session
    select pid as process_id,
    usename as username,
    datname as database_name,
    client_addr as client_address,
    application_name,
    backend_start,
    state,
    state_change
    from pg_stat_activity;

-- Create Database
    create database '<DATABASE_NAME>'
    owner '<USER_DB_OWNER>'
    encoding 'UTF-8' tablespace pg_default;

-- Drop Database
    drop database '<DATABASE_NAME>';
