--작업일시: 221115 am10:32

DROP TABLE IF EXISTS GSCN.GSCN_DIAG_INF;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_INF_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_INF (
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               diag_rgst_ymd timestamp NOT NULL, -- 진단등록일자
                               diag_rgst_seq numeric(3) NOT NULL, -- 진단등록순번
                               diag_kncd varchar(20) NULL, -- 위암진단종류코드
                               diag_knnm varchar(200) NULL, -- 진단종류명
                               diag_cd varchar(20) NULL, -- 진단코드
                               diag_nm varchar(200) NULL, -- 진단명
                               diag_kcd_cd varchar(20) NULL, -- 진단KCD코드
                               diag_kcd_nm varchar(200) NULL, -- 진단KCD명
                               diag_smct_cd varchar(200) NULL, -- 진단SNOMEDCT코드
                               diag_smct_nm varchar(1000) NULL, -- 진단SNOMEDCT명
                               crtn_dt timestamp NOT NULL, -- 생성일시
                               PACT_ID varchar(50) null,				-- PACT_ID
                               idx varchar(20) NULL, -- UI용 시퀀스
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_diag_inf_pk PRIMARY KEY (hosp_cd, pt_no, diag_rgst_ymd, diag_rgst_seq)
);
