--작업일시: 221115 am10:32

DROP TABLE IF EXISTS GSCN.GSCN_DIAG_STAG;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_STAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_STAG (
                                hosp_cd varchar(20) NOT NULL, 				-- 병원코드
                                pt_no varchar(10) NOT NULL, 				-- 환자대체번호
                                diag_stag_rcrd_ymd timestamp NOT NULL, 	-- 진단병기기록일자
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
                                CONSTRAINT GSCN_DIAG_STAG_pk PRIMARY KEY (hosp_cd, pt_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq)
);


INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9500, 'GSCN.GSCN_DIAG_STAG', '05.위암_진단_병기', true, 5, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9500, null, '05.위암_진단_병기');

insert into ph_item (id, title, category_id, created_by, order_no) values (9501, 'hosp_cd', 9500, 'system', 9501);
insert into ph_item_attribute (item_id, caption, required) values (9501, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9502, 'pt_no', 9500, 'system', 9502);
insert into ph_item_attribute (item_id, caption) values (9502, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9502, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9503, 'diag_stag_rcrd_ymd', 9500, 'system', 9503);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9503, '진단병기기록일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9504, 'diag_stag_rcrd_seq', 9500, 'system', 9504);
insert into ph_item_attribute (item_id, caption, required) values (9504, '진단병기기록순번', true);

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9505, 'clnc_tumr_prty_cd', 9500, 'system', 9505, 20050);
insert into ph_item_attribute (item_id, caption, data_type) values (9505, '임상종양특성코드', 'selectbox');
insert into ph_item_property (item_id, label_column) values (9505, 'clnc_tumr_prty_nm');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9506, 'clnc_tumr_prty_nm', 9500, 'system', 9506);
-- insert into ph_item_attribute (item_id, caption) values (9506, '임상종양특성명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9507, 'ajcc_yr', 9500, 'system', 9507);
insert into ph_item_attribute (item_id, caption) values (9507, 'AJCC년도');

insert into ph_item (id, title, category_id, created_by, order_no) values (9508, 'clnc_tnm_stag_vl', 9500, 'system', 9508);
insert into ph_item_attribute (item_id, caption) values (9508, '임상TNM병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9509, 'clnc_t_stag_vl', 9500, 'system', 9509);
insert into ph_item_attribute (item_id, caption) values (9509, '임상T병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9510, 'clnc_n_stag_vl', 9500, 'system', 9510);
insert into ph_item_attribute (item_id, caption) values (9510, '임상N병기값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9511, 'clnc_m_stag_vl', 9500, 'system', 9511);
insert into ph_item_attribute (item_id, caption) values (9511, '임상M병기값');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9512, 'crtn_dt', 9500, 'system', 9512);
-- insert into ph_item_attribute (item_id, caption, format, data_type) values (9512, '생성일시', 'yyyy-MM-dd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9513, 'idx', 9500, 'system', 9513);
-- insert into ph_item_attribute (item_id, caption) values (9513, 'UI용 시퀀스');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9514, 'mdfm_id', 9500, 'system', 9514);
-- insert into ph_item_attribute (item_id, caption) values (9514, 'UI용 서식ID');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9515, 'mdfm_nm', 9500, 'system', 9515);
-- insert into ph_item_attribute (item_id, caption) values (9515, 'UI용 서식명');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9516, 'clnc_cnte', 9500, 'system', 9516);
-- insert into ph_item_attribute (item_id, caption) values (9516, 'UI용 임상내용');
