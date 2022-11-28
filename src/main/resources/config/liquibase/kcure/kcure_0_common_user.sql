insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (101, 'supervisor01', '홍성옥', '$2a$12$1/CubiWu4GoLMgbsOmXmSeDTtWlBXAM.07bBNT.kiOfh.aCP7IhNS', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (102, 'supervisor02', '이신애', '$2a$12$1/CubiWu4GoLMgbsOmXmSeDTtWlBXAM.07bBNT.kiOfh.aCP7IhNS', 'ko', 'system', true);

insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (103, 'kcure01', '권예지', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (104, 'kcure02', '김서현', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (105, 'kcure03', '김혜진', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (106, 'kcure04', '남보미', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (107, 'kcure05', '서민지', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (108, 'kcure06', '윤채연', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (109, 'kcure07', '이영준', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (110, 'kcure08', '이윤서', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (111, 'kcure09', '정소진', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);
insert into public.ph_user (id, login, name, password_hash, lang_key, created_by, activated)
values (112, 'kcure10', '최지원', '$2a$12$aPUUeHfRckVxmvRJQLYSlu7CMhn6.kVcm3yX613P15iOkscnUhdO2', 'ko', 'system', true);

INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (101, 'ROLE_SUPERVISOR');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (102, 'ROLE_SUPERVISOR');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (103, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (104, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (105, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (106, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (107, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (108, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (109, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (110, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (111, 'ROLE_USER');
INSERT INTO PH_USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (112, 'ROLE_USER');
