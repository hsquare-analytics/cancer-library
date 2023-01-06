DROP TABLE IF EXISTS GSCN.GSCN_EXAM_DIAG;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_DIAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_DIAG (
    hosp_cd varchar(20) NOT NULL, 			-- 병원코드
    pt_no varchar(10) NOT NULL, 			-- 환자대체번호
    cexm_ymd timestamp NOT NULL, 			-- 진단검사일자
    cexm_seq numeric(3) NOT NULL, 			-- 진단검사순번
    cexm_kncd varchar(20) NULL, 			-- 진단검사종류코드
    cexm_knnm varchar(200) NULL, 			-- 진단검사종류명
    cexm_cd varchar(20) NULL, 				-- 진단검사코드
    cexm_nm varchar(200) NULL, 				-- 진단검사명
    cexm_edi_cd varchar(20) NULL, 			-- 진단검사EDI코드
    cexm_edi_nm varchar(200) NULL, 			-- 진단검사EDI명
    cexm_smct_cd varchar(200) NULL, 		-- 진단검사SNOMEDCT코드
    cexm_smct_nm varchar(1000) NULL, 		-- 진단검사SNOMEDCT명
    cexm_loinc_cd varchar(20) NULL, 		-- 진단검사LOINC코드
    cexm_loinc_nm varchar(1000) NULL, 		-- 진단검사LOINC명
    cexm_rslt_cont varchar(4000) NULL, 		-- 진단검사결과내용
    cexm_rslt_unit_cont varchar(200) NULL, 	-- 진단검사결과단위내용
    cexm_nlrg_ref_vl varchar(200) NULL, 	-- 진단검사정상범위참고값
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(20) null,				-- UI용 검체번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_exam_diag_pk PRIMARY KEY (hosp_cd, pt_no, cexm_ymd, cexm_seq)
    );
