DROP TABLE IF EXISTS GSCN.GSCN_EXAM_MLPT;
DROP TABLE IF EXISTS GSCN.GSCN_EXAM_MLPT_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_EXAM_MLPT (
    hosp_cd varchar(20) NOT NULL, -- 병원코드
    pt_no varchar(10) NOT NULL, -- 환자대체번호
    mlem_ymd timestamp NOT NULL, -- 분자병리검사일자
    mlem_seq numeric(3) NOT NULL, -- 분자병리검사순번
    mlpt_read_ymd timestamp NULL, -- 분자병리판독일자
    mlem_cd varchar(20) NULL, -- 분자병리검사코드
    mlem_nm varchar(200) NULL, -- 분자병리검사명
    mlem_kncd varchar(20) NULL, -- 분자병리검사종류코드
    mlem_knnm varchar(200) NULL, -- 분자병리검사종류명
    mlem_opn_cd varchar(20) NULL, -- 분자병리검사소견코드
    mlem_opn_nm varchar(200) NULL, -- 분자병리검사소견명
    mlem_rslt_cont varchar(200) NULL, -- 분자병리검사결과내용
    mlem_rslt_unit_cont varchar(200) NULL, -- 분자병리검사결과단위내용
    crtn_dt timestamp NOT NULL, -- 생성일시
    idx varchar(20) NULL, 					-- UI용 시퀀스
    exm_no varchar(50) NULL, 				-- UI용 검사번호
    pact_id varchar(50) null,				-- UI용 PACT_ID
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_exam_mlpt_pk PRIMARY KEY (hosp_cd, pt_no, mlem_ymd, mlem_seq)
    );
