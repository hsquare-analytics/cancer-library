create table ph_db
(
    id bigint primary key ,
    db_key    varchar(50) not null ,
    driver_nm varchar(200) not null ,
    jdbc_url  varchar(200) not null ,
    user_nm   varchar(200) not null ,
    user_pw   varchar(200) not null ,
    db_type   varchar(10) ,
    schema    varchar(10),
    is_active boolean   default false,
    dbms      varchar(10) not null ,
    created_by varchar(50),
    created_date timestamp default now(),
    last_modified_by varchar(50),
    last_modified_date  timestamp default now()
)
