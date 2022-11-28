DROP TABLE IF EXISTS GSCN.GSCN_DIAG_MTST;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_MTST_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_MTST (
    hosp_cd varchar(20) NOT NULL, 			-- 병원코드
    pt_no varchar(10) NOT NULL, 		-- 환자대체번호
    mtdg_ymd timestamp NOT NULL, 			-- 전이진단일자
    mtdg_seq numeric(3) NOT NULL, 			-- 전이진단순번
    mtdg_mtcd varchar(20) NULL, 			-- 전이진단방법코드
    mtdg_mtnm varchar(200) NULL, 			-- 전이진단방법명
    mtst_site_cd varchar(20) NULL, 			-- 전이부위코드
    mtst_site_nm varchar(200) NULL, 		-- 전이부위명
    mtst_aspt_cd varchar(20) NULL, 			-- 전이양상코드
    mtst_aspt_nm varchar(200) NULL, 		-- 전이양상명
    mtst_trtm_cd varchar(20) NULL, 			-- 전이치료코드
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    mdfm_id varchar(20) null,				-- UI용 서식ID
    mdfm_nm varchar(50) null,				-- UI용 서식명
    mtst_site_nm_cnte varchar(200) NULL, 	-- UI용 전이부위명
    CONSTRAINT gscn_diag_mtst_pk PRIMARY KEY (hosp_cd, pt_no, mtdg_ymd, mtdg_seq)
    );

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9600, 'GSCN.GSCN_DIAG_MTST', '06.위암_진단_전이', true, 6, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9600, null, '06.위암_진단_전이');


insert into ph_item (id, title, category_id, created_by, order_no) values (9601, 'hosp_cd', 9600, 'system', 9601);
insert into ph_item_attribute (item_id, caption, required) values (9601, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9602, 'pt_no', 9600, 'system', 9602);
insert into ph_item_attribute (item_id, caption) values (9602, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9602, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9603, 'mtdg_ymd', 9600, 'system', 9603);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9603, '전이진단일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9604, 'mtdg_seq', 9600, 'system', 9604);
insert into ph_item_attribute (item_id, caption, required) values (9604, '전이진단순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9605, 'mtdg_mtcd', 9600, 'system', 9605, 20080);
insert into ph_item_attribute (item_id, caption, required, data_type) values (9605, '전이진단방법코드', true, 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9606, 'mtdg_mtnm', 9600, 'system', 9606);
insert into ph_item_attribute (item_id, caption) values (9606, '전이진단방법명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9607, 'mtst_site_cd', 9600, 'system', 9607, 20060);
insert into ph_item_attribute (item_id, caption, data_type) values (9607, '전이부위코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9608, 'mtst_site_nm', 9600, 'system', 9608);
insert into ph_item_attribute (item_id, caption) values (9608, '전이부위명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9609, 'mtst_aspt_cd', 9600, 'system', 9609, 20070);
insert into ph_item_attribute (item_id, caption, data_type) values (9609, '전이양상코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9610, 'mtst_aspt_nm', 9600, 'system', 9610);
insert into ph_item_attribute (item_id, caption) values (9610, '전이양상명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9611, 'mtst_trtm_cd', 9600, 'system', 9611, 20090);
insert into ph_item_attribute (item_id, caption, data_type) values (9611, '전이치료코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9612, 'crtn_dt', 9600, 'system', 9612);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9612, '생성일시', 'yyyy-MM-dd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9613, 'idx', 9600, 'system', 9613);
-- insert into ph_item_attribute (item_id, caption) values (9613, 'UI용 시퀀스');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9614, 'mdfm_id', 9600, 'system', 9614);
-- insert into ph_item_attribute (item_id, caption) values (9614, 'UI용 서식ID');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (9615, 'mdfm_nm', 9600, 'system', 9615);
-- insert into ph_item_attribute (item_id, caption) values (9615, 'UI용 서식명');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (9616, 'mtst_site_nm_cnte', 9600, 'system', 9616);
-- insert into ph_item_attribute (item_id, caption) values (9616, 'UI용 전이부위명');
