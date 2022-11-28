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
    CONSTRAINT cncr_rgst_pk PRIMARY KEY (hosp_cd, pt_no, idx)
);


INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9000, 'GSCN.CNCR_RGST', '00.암등록', true, 0, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9000, null, '00.암등록');

insert into ph_item (id, title, category_id, created_by, order_no) values (9001, 'hosp_cd', 9000, 'system', 9001);
insert into ph_item_attribute (item_id, caption, required) values (9001, '병원번호', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9002, 'pt_no', 9000, 'system', 9002);
insert into ph_item_attribute (item_id, caption) values (9002, '환자등록번호');
insert into ph_item_property (item_id, visible) values (9002, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9003, 'fdx', 9000, 'system', 9003);
insert into ph_item_attribute (item_id, caption) values (9003, '초진연월일');

insert into ph_item (id, title, category_id, created_by, order_no) values (9004, 'brth', 9000, 'system', 9004);
insert into ph_item_attribute (item_id, caption) values (9004, '생년월');

insert into ph_item (id, title, category_id, created_by, order_no) values (9005, 'age', 9000, 'system', 9005);
insert into ph_item_attribute (item_id, caption) values (9005, '나이');

insert into ph_item (id, title, category_id, created_by, order_no) values (9006, 'sex', 9000, 'system', 9006);
insert into ph_item_attribute (item_id, caption) values (9006, '성별');

insert into ph_item (id, title, category_id, created_by, order_no) values (9007, 'popcode', 9000, 'system', 9007);
insert into ph_item_attribute (item_id, caption) values (9007, '모집단구분코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9008, 'popname', 9000, 'system', 9008);
insert into ph_item_attribute (item_id, caption) values (9008, '모집단구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9009, 'frgcode', 9000, 'system', 9009, 60030);
insert into ph_item_attribute (item_id, caption, data_type) values (9009, '외국인코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9010, 'frgname', 9000, 'system', 9010);
insert into ph_item_attribute (item_id, caption) values (9010, '외국인명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9011, 'hmlscode', 9000, 'system', 9011);
insert into ph_item_attribute (item_id, caption) values (9011, '행려환자코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9012, 'hmlsname', 9000, 'system', 9012);
insert into ph_item_attribute (item_id, caption) values (9012, '행려환자');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9013, 'jobcode', 9000, 'system', 9013, 60050);
insert into ph_item_attribute (item_id, caption, data_type) values (9013, '직업분류코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9014, 'jobname', 9000, 'system', 9014);
insert into ph_item_attribute (item_id, caption) values (9014, '직업분류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9015, 'job1', 9000, 'system', 9015);
insert into ph_item_attribute (item_id, caption) values (9015, '직업분류기타');

insert into ph_item (id, title, category_id, created_by, order_no) values (9016, 'unknownjob', 9000, 'system', 9016);
insert into ph_item_attribute (item_id, caption) values (9016, '직업상세설명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9017, 'visitpathcode', 9000, 'system', 9017, 60060);
insert into ph_item_attribute (item_id, caption, data_type) values (9017, '진단경로코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9018, 'visitpathname', 9000, 'system', 9018);
insert into ph_item_attribute (item_id, caption) values (9018, '진단경로명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9019, 'visitpath_desc', 9000, 'system', 9019);
insert into ph_item_attribute (item_id, caption) values (9019, '진단경로5세부설명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9020, 'tcode', 9000, 'system', 9020);
insert into ph_item_attribute (item_id, caption) values (9020, '원발부위코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9021, 'tcode1', 9000, 'system', 9021);
insert into ph_item_attribute (item_id, caption) values (9021, '원발부위코드설명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9022, 'tcode2', 9000, 'system', 9022);
insert into ph_item_attribute (item_id, caption) values (9022, '원발부위코드기타설명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9023, 'latercode', 9000, 'system', 9023, 60070);
insert into ph_item_attribute (item_id, caption, data_type) values (9023, '편측성코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9024, 'latername', 9000, 'system', 9024);
insert into ph_item_attribute (item_id, caption) values (9024, '편측성명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9025, 'mcode', 9000, 'system', 9025);
insert into ph_item_attribute (item_id, caption) values (9025, '조직학적진단명코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9026, 'mcode1', 9000, 'system', 9026);
insert into ph_item_attribute (item_id, caption) values (9026, '조직학적진단명코드설명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9027, 'mcode2', 9000, 'system', 9027);
insert into ph_item_attribute (item_id, caption) values (9027, '조직학적진단명코드기타설명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9028, 'bunhwadocode', 9000, 'system', 9028, 60070);
insert into ph_item_attribute (item_id, caption, data_type) values (9028, '분화도코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9029, 'bunhwadoname', 9000, 'system', 9029);
insert into ph_item_attribute (item_id, caption) values (9029, '분화도명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9030, 'expire', 9000, 'system', 9030);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9030, '사망연월일', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9031, 'sain', 9000, 'system', 9031);
insert into ph_item_attribute (item_id, caption) values (9031, '사망원인');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9032, 'methodcode', 9000, 'system', 9032, 60090);
insert into ph_item_attribute (item_id, caption, data_type) values (9032, '진단방법코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9033, 'methodname', 9000, 'system', 9033);
insert into ph_item_attribute (item_id, caption) values (9033, '진단방법명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9034, 'method2', 9000, 'system', 9034);
insert into ph_item_attribute (item_id, caption) values (9034, '진단방법 임상검사2세부사항');

insert into ph_item (id, title, category_id, created_by, order_no) values (9035, 'methodetc', 9000, 'system', 9035);
insert into ph_item_attribute (item_id, caption) values (9035, '진단방법 임상검사2기타사항');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9036, 'txcheckcode', 9000, 'system', 9036, 60100);
insert into ph_item_attribute (item_id, caption, data_type) values (9036, '치료 시행 여부코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9037, 'txcheckname', 9000, 'system', 9037);
insert into ph_item_attribute (item_id, caption) values (9037, '치료시행여부명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9038, 'tx', 9000, 'system', 9038);
insert into ph_item_attribute (item_id, caption) values (9038, '치료');

insert into ph_item (id, title, category_id, created_by, order_no) values (9039, 'txetc', 9000, 'system', 9039);
insert into ph_item_attribute (item_id, caption) values (9039, '기타치료');

insert into ph_item (id, title, category_id, created_by, order_no) values (9040, 'recoyear', 9000, 'system', 9040);
insert into ph_item_attribute (item_id, caption) values (9040, '출생 연대 표기');

insert into ph_item (id, title, category_id, created_by, order_no) values (9041, 'admisdate', 9000, 'system', 9041);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9041, '입원일', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9042, 'disdate', 9000, 'system', 9042);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9042, '퇴원일', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9043, 'dbyear', 9000, 'system', 9043);
insert into ph_item_attribute (item_id, caption) values (9043, '자료등록년도');

insert into ph_item (id, title, category_id, created_by, order_no) values (9044, 'inputday', 9000, 'system', 9044);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9044, '입력일', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9045, 'seeryear', 9000, 'system', 9045);
insert into ph_item_attribute (item_id, caption) values (9045, 'SEERYEAR');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9046, 'seercode', 9000, 'system', 9046, 60110);
insert into ph_item_attribute (item_id, caption, data_type) values (9046, 'SEERCODE', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9047, 'seername', 9000, 'system', 9047);
insert into ph_item_attribute (item_id, caption) values (9047, 'SEERNAME');

insert into ph_item (id, title, category_id, created_by, order_no) values (9048, 'stagecode', 9000, 'system', 9048);
insert into ph_item_attribute (item_id, caption) values (9048, 'STAGE코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9049, 'stageyear', 9000, 'system', 9049);
insert into ph_item_attribute (item_id, caption) values (9049, 'STAGEYEAR');

insert into ph_item (id, title, category_id, created_by, order_no) values (9050, 'stagedesc', 9000, 'system', 9050);
insert into ph_item_attribute (item_id, caption) values (9050, '병기STAGE');

insert into ph_item (id, title, category_id, created_by, order_no) values (9051, 'metacode1', 9000, 'system', 9051);
insert into ph_item_attribute (item_id, caption) values (9051, '원격전이코드1');

insert into ph_item (id, title, category_id, created_by, order_no) values (9052, 'metacode2', 9000, 'system', 9052);
insert into ph_item_attribute (item_id, caption) values (9052, '원격전이코드2');

insert into ph_item (id, title, category_id, created_by, order_no) values (9053, 'metacode3', 9000, 'system', 9053);
insert into ph_item_attribute (item_id, caption) values (9053, '원격전이코드3');

insert into ph_item (id, title, category_id, created_by, order_no) values (9054, 'crtn_dt', 9000, 'system', 9054);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9054, '생성일시', 'yyyy-MM-dd', 'date');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9055, 'idx', 9000, 'system', 9055);
-- insert into ph_item_attribute (item_id, caption) values (9055, 'UI용 시퀀스');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (9056, 'pt_nm', 9000, 'system', 9056);
-- insert into ph_item_attribute (item_id, caption) values (9056, 'UI용 환자명');
--
-- insert into ph_item (id, title, category_id, created_by, order_no) values (9057, 'pt_brdy_dt', 9000, 'system', 9057);
-- insert into ph_item_attribute (item_id, caption) values (9057, 'UI용 생년월일');
