DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMPT;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMPT_updated;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_IMPT (
    hosp_cd varchar(20) NOT NULL, -- 병원코드
    pt_no varchar(10) NOT NULL, -- 환자대체번호
    imem_ymd timestamp NOT NULL, -- 면역병리검사일자
    imem_seq numeric(3) NOT NULL, -- 면역병리검사순번
    impt_read_ymd timestamp NULL, -- 면역병리판독일자
    imem_cd varchar(20) NULL, -- 면역병리검사코드
    imem_nm varchar(200) NULL, -- 면역병리검사명
    imem_kncd varchar(20) NULL, -- 면역병리검사종류코드
    imem_knnm varchar(200) NULL, -- 면역병리검사종류명
    imem_opn_cd varchar(20) NULL, -- 면역병리검사소견코드
    imem_opn_nm varchar(200) NULL, -- 면역병리검사소견명
    imem_rslt_cont varchar(200) NULL, -- 면역병리검사결과내용
    imem_rslt_unit_cd varchar(20) NULL, -- 면역병리검사결과단위코드
    imem_rslt_unit_nm varchar(200) NULL, -- 면역병리검사결과단위명
    crtn_dt timestamp NOT NULL, -- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(50) NULL, 				-- UI용 검사번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_exam_impt_pk PRIMARY KEY (hosp_cd, pt_no, imem_ymd, imem_seq)
    );
