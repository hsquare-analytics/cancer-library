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
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_diag_mtst_pk PRIMARY KEY (hosp_cd, pt_no, mtdg_ymd, mtdg_seq)
    );
