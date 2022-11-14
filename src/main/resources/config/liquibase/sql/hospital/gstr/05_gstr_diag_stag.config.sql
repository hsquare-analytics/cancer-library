DROP TABLE IF EXISTS GSTR.GSTR_DIAG_STAG;
DROP TABLE IF EXISTS GSTR.GSTR_DIAG_STAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_STAG (
                                hosp_cd varchar(20) NOT NULL, 				-- 병원코드
                                pt_no varchar(10) NOT NULL, 				-- 환자대체번호
                                diag_stag_rcrd_ymd varchar(8) NOT NULL, 	-- 진단병기기록일자
                                diag_stag_rcrd_seq numeric(3) NOT NULL, 	-- 진단병기기록순번
                                clnc_tumr_prty_cd varchar(20) NULL, 		-- 임상종양특성코드
                                clnc_tumr_prty_nm varchar(200) NULL, 		-- 임상종양특성명
                                ajcc_yr varchar(4) NULL, 					-- AJCC년도
                                clnc_tnm_stag_vl varchar(10) NULL, 			-- 임상TNM병기값
                                clnc_t_stag_vl varchar(10) NULL, 			-- 임상T병기값
                                clnc_n_stag_vl varchar(10) NULL, 			-- 임상N병기값
                                clnc_m_stag_vl varchar(10) NULL, 			-- 임상M병기값
                                crtn_dt timestamp NOT NULL, 				-- 생성일시
                                idx varchar(20) NULL, 						-- UI용 시퀀스
                                mdfm_id varchar(20) null,					-- UI용 서식ID
                                mdfm_nm varchar(50) null,					-- UI용 서식명
                                clnc_cnte varchar(4000) null,				-- UI용 임상내용
                                CONSTRAINT GSTR_DIAG_STAG_pk PRIMARY KEY (hosp_cd, pt_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq)
);

CREATE TABLE IF NOT EXISTS GSTR.GSTR_DIAG_STAG_UPDATED (
                                hosp_cd varchar(20) NOT NULL, 				-- 병원코드
                                pt_no varchar(10) NOT NULL, 				-- 환자대체번호
                                diag_stag_rcrd_ymd varchar(8) NOT NULL, 	-- 진단병기기록일자
                                diag_stag_rcrd_seq numeric(3) NOT NULL, 	-- 진단병기기록순번
                                clnc_tumr_prty_cd varchar(20) NULL, 		-- 임상종양특성코드
                                clnc_tumr_prty_nm varchar(200) NULL, 		-- 임상종양특성명
                                ajcc_yr varchar(4) NULL, 					-- AJCC년도
                                clnc_tnm_stag_vl varchar(10) NULL, 			-- 임상TNM병기값
                                clnc_t_stag_vl varchar(10) NULL, 			-- 임상T병기값
                                clnc_n_stag_vl varchar(10) NULL, 			-- 임상N병기값
                                clnc_m_stag_vl varchar(10) NULL, 			-- 임상M병기값
                                crtn_dt timestamp NOT NULL, 				-- 생성일시
                                idx varchar(20) NULL, 						-- UI용 시퀀스
                                mdfm_id varchar(20) null,					-- UI용 서식ID
                                mdfm_nm varchar(50) null,					-- UI용 서식명
                                clnc_cnte varchar(4000) null,				-- UI용 임상내용
                                CREATED_BY         CHARACTER VARYING(50),
                                CREATED_DATE       TIMESTAMP,
                                LAST_MODIFIED_BY   CHARACTER VARYING(50),
                                LAST_MODIFIED_DATE TIMESTAMP,
                                STATUS             VARCHAR(50),
                                CONSTRAINT GSTR.GSTR_DIAG_STAG_pk_UPDATED PRIMARY KEY (hosp_cd, pt_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (6000, 'GSTR.GSTR_DIAG_STAG', '위암_진단_병기', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (6000, null, '위암_진단_병기');

insert into ph_item (id, title, activated, category_id, created_by) values (6001, 'hosp_cd', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6001, '병원코드');

insert into ph_item (id, title, activated, category_id, created_by) values (6002, 'pt_no', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6002, '환자대체번호');

insert into ph_item (id, title, activated, category_id, created_by) values (6003, 'diag_stag_rcrd_ymd', true, 6000, 'system');
insert into ph_item_property (item_id, caption, format) values (6003, '진단병기기록일자', 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (6003, 'date');

insert into ph_item (id, title, activated, category_id, created_by) values (6004, 'diag_stag_rcrd_seq', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6004, '진단병기기록순번');

insert into ph_item (id, title, activated, category_id, created_by, codebook_id) values (6005, 'clnc_tumr_prty_cd', true, 6000, 'system', 20050);
insert into ph_item_property (item_id, caption) values (6005, '임상종양특성코드');
insert into ph_item_attribute (item_id, data_type) values (6005, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (6006, 'clnc_tumr_prty_nm', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6006, '임상종양특성명');

insert into ph_item (id, title, activated, category_id, created_by) values (6007, 'ajcc_yr', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6007, 'AJCC년도');

insert into ph_item (id, title, activated, category_id, created_by) values (6008, 'clnc_tnm_stag_vl', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6008, '임상TNM병기값');

insert into ph_item (id, title, activated, category_id, created_by) values (6009, 'clnc_t_stag_vl', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6009, '임상T병기값');

insert into ph_item (id, title, activated, category_id, created_by) values (6010, 'clnc_n_stag_vl', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6010, '임상N병기값');

insert into ph_item (id, title, activated, category_id, created_by) values (6011, 'clnc_m_stag_vl', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6011, '임상M병기값');

insert into ph_item (id, title, activated, category_id, created_by) values (6012, 'crtn_dt', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6012, '생성일시');

insert into ph_item (id, title, activated, category_id, created_by) values (6014, 'mdfm_id', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6014, 'UI용 서식ID');

insert into ph_item (id, title, activated, category_id, created_by) values (6015, 'mdfm_nm', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6015, 'UI용 서식명');

insert into ph_item (id, title, activated, category_id, created_by) values (6016, 'clnc_cnte', true, 6000, 'system');
insert into ph_item_property (item_id, caption) values (6016, 'UI용 임상내용');
