DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMAG;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_IMAG_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_IMAG (
    hosp_cd varchar(20) NOT NULL, 			-- 병원코드
    pt_no varchar(10) NOT NULL, 			-- 환자대체번호
    imex_ymd timestamp NOT NULL, 			-- 영상검사일자
    imex_seq numeric(3) NOT NULL, 			-- 영상검사순번
    imex_kncd varchar(20) NULL, 			-- 영상검사종류코드
    imex_knnm varchar(200) NULL, 			-- 영상검사종류명
    imex_cd varchar(20) NULL, 				-- 영상검사코드
    imex_nm varchar(200) NULL, 				-- 영상검사명
    imex_edi_cd varchar(20) NULL,	 		-- 영상검사EDI코드
    imex_edi_nm varchar(200) NULL, 			-- 영상검사EDI명
    imex_smct_cd varchar(200) NULL, 		-- 영상검사SNOMEDCT코드
    imex_smct_nm varchar(1000) NULL, 		-- 영상검사SNOMEDCT명
    imex_rslt_cont varchar(4000) NULL, 		-- 영상검사결과내용
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    pact_id varchar(50) null,				-- PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_exam_imag_pk PRIMARY KEY (hosp_cd, pt_no, imex_ymd, imex_seq)
    );
