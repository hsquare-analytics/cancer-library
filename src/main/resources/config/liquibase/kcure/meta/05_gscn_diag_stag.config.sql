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
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT GSCN_DIAG_STAG_pk PRIMARY KEY (hosp_cd, pt_no, diag_stag_rcrd_ymd, diag_stag_rcrd_seq)
);
