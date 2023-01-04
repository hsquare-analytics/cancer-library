--작업일시: 221121 am10:00

DROP TABLE IF EXISTS GSCN.CNCR_RGST;
DROP TABLE IF EXISTS GSCN.CNCR_RGST_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.CNCR_RGST (
    hosp_cd varchar(4) NOT NULL, 			-- 병원번호
    pt_no varchar(15) NOT NULL, 			-- 환자등록번호
    fdx varchar(8) NULL, 					-- 초진연월일
    brth varchar(6) NULL, 					-- 생년월
    age varchar(3) NULL, 					-- 나이
    sex varchar(20) NULL, 					-- 성별
    popcode varchar(20) NULL, 				-- 모집단구분코드
    popname varchar(50) NULL, 				-- 모집단구분명
    frgcode varchar(20) NULL, 				-- 외국인코드
    frgname varchar(50) NULL, 				-- 외국인명
    hmlscode varchar(20) NULL, 				-- 행려환자
    hmlsname varchar(50) NULL, 				-- 행려환자
    jobcode varchar(20) NULL, 				-- 직업분류코드
    jobname varchar(50) NULL, 				-- 직업분류명
    job1 varchar(50) NULL, 					-- 직업분류기타
    unknownjob varchar(50) NULL, 			-- 직업상세설명
    visitpathcode varchar(20) NULL, 		-- 진단경로코드
    visitpathname varchar(50) NULL, 		-- 진단경로명
    visitpath_desc varchar(50) NULL, 		-- 진단경로5세부설명
    tcode varchar(20) NULL, 				-- 원발부위코드
    tcode1 varchar(50) NULL, 				-- 원발부위코드설명
    tcode2 varchar(50) NULL, 				-- 원발부위코드기타설명
    latercode varchar(20) NULL, 			-- 편측성코드
    latername varchar(100) NULL, 			-- 편측성명
    mcode varchar(20) NULL, 				-- 조직학적진단명코드
    mcode1 varchar(50) NULL, 				-- 조직학적진단명코드설명
    mcode2 varchar(50) NULL, 				-- 조직학적진단명코드기타설명
    bunhwadocode varchar(20) NULL, 			-- 분화도코드
    bunhwadoname varchar(50) NULL, 			-- 분화도명
    expire varchar(8) NULL, 				-- 사망연월일
    sain varchar(20) NULL, 					-- 사망원인
    methodcode varchar(20) NULL, 			-- 진단방법코드
    methodname varchar(100) NULL, 			-- 진단방법명
    method2 varchar(50) NULL, 				-- 진단방법 임상검사2세부사항
    methodetc varchar(50) NULL, 			-- 진단방법 임상검사2기타사항
    txcheckcode varchar(20) NULL,	 		-- 치료 시행 여부코드
    txcheckname varchar(50) NULL, 			-- 치료시행여부명
    tx varchar(20) NULL, 					-- 치료
    txetc varchar(50) NULL, 				-- 기타치료
    recoyear varchar(50) NULL, 				-- 출생 연대 표기
    admisdate varchar(8) NULL,	 			-- 입원일
    disdate varchar(8) NULL, 				-- 퇴원일
    dbyear varchar(4) NULL, 				-- 자료등록년도
    inputday varchar(8) NULL, 				-- 입력일
    seeryear varchar(4) NULL, 				-- SEERYEAR
    seercode varchar(20) NULL, 				-- SEERCODE
    seername varchar(100) NULL, 			-- SEERNAME
    stagecode varchar(20) NULL, 			-- STAGE코드
    stageyear varchar(4) NULL, 				-- STAGEYEAR
    stagedesc varchar(50) NULL, 			-- 병기STAGE
    metacode1 varchar(20) NULL, 			-- 원격전이코드1
    metacode2 varchar(20) NULL, 			-- 원격전이코드2
    metacode3 varchar(20) NULL, 			-- 원격전이코드3
    crtn_dt timestamp NOT NULL, 			-- 생성일시
    idx varchar(20) null,					-- UI용 시퀀스용
    PT_NM VARCHAR(50) null, 				-- UI용 환자명
    PT_BRDY_DT VARCHAR(50) null, 			-- UI용 생년월일
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT cncr_rgst_pk PRIMARY KEY (hosp_cd, pt_no, idx)
);
