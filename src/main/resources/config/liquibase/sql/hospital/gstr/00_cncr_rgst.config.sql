DROP TABLE IF EXISTS GSTR.CNCR_RGST;
DROP TABLE IF EXISTS GSTR.CNCR_RGST_UPDATED;

CREATE TABLE IF NOT EXISTS GSTR.CNCR_RGST (
                           hosp_cd varchar(4) NOT NULL, 			-- 병원번호
                           pt_no varchar(15) NOT NULL, 		-- 환자등록번호 ptno -> pt_no 변경
                           fdx varchar(8) NULL, 				-- 초진연월일
                           brth varchar(6) NULL, 				-- 생년월
                           age varchar(3) NULL, 				-- 나이
                           sex varchar(20) NULL, 				-- 성별
                           popcode varchar(20) NULL, 			-- 모집단구분코드
                           popname varchar(50) NULL, 			-- 모집단구분명
                           frgcode varchar(20) NULL, -- 외국인코드
                           frgname varchar(50) NULL, -- 외국인명
                           hmlscode varchar(20) NULL, -- 행려환자
                           hmlsname varchar(50) NULL, -- 행려환자
                           jobcode varchar(20) NULL, -- 직업분류코드
                           jobname varchar(50) NULL, -- 직업분류명
                           job1 varchar(50) NULL, -- 직업분류기타
                           unknownjob varchar(50) NULL, -- 직업상세설명
                           visitpathcode varchar(20) NULL, -- 진단경로코드
                           visitpathname varchar(50) NULL, -- 진단경로명
                           visitpath_desc varchar(50) NULL, -- 진단경로5세부설명
                           tcode varchar(20) NULL, -- 원발부위코드
                           tcode1 varchar(50) NULL, -- 원발부위코드설명
                           tcode2 varchar(50) NULL, -- 원발부위코드기타설명
                           latercode varchar(20) NULL, -- 편측성코드
                           latername varchar(100) NULL, -- 편측성명
                           mcode varchar(20) NULL, -- 조직학적진단명코드
                           mcode1 varchar(50) NULL, -- 조직학적진단명코드설명
                           mcode2 varchar(50) NULL, -- 조직학적진단명코드기타설명
                           bunhwadocode varchar(20) NULL, -- 분화도코드
                           bunhwadoname varchar(50) NULL, -- 분화도명
                           expire varchar(8) NULL, -- 사망연월일
                           sain varchar(20) NULL, -- 사망원인
                           methodcode varchar(20) NULL, -- 진단방법코드
                           methodname varchar(100) NULL, -- 진단방법명
                           method2 varchar(50) NULL, -- 진단방법 임상검사2세부사항
                           methodetc varchar(50) NULL, -- 진단방법 임상검사2기타사항
                           txcheckcode varchar(20) NULL, -- 치료 시행 여부코드
                           txcheckname varchar(50) NULL, -- 치료시행여부명
                           tx varchar(20) NULL, -- 요법
                           txetc varchar(50) NULL, -- 기타치료
                           recoyear varchar(50) NULL, -- 출생 연대 표기
                           admisdate varchar(8) NULL, -- 입원일
                           disdate varchar(8) NULL, -- 퇴원일
                           dbyear varchar(4) NULL, -- 자료등록년도
                           inputday varchar(8) NULL, -- 입력일
                           seeryear varchar(4) NULL, -- SEERYEAR
                           seercode varchar(20) NULL, -- SEERCODE
                           seername varchar(100) NULL, -- SEERNAME
                           stagecode varchar(20) NULL, -- STAGE코드
                           stageyear varchar(4) NULL, -- STAGEYEAR
                           stagedesc varchar(50) NULL, -- 병기STAGE
                           metacode1 varchar(20) NULL, -- 원격전이코드1
                           metacode2 varchar(20) NULL, -- 원격전이코드2
                           metacode3 varchar(20) NULL, -- 원격전이코드3
                           crtn_dt timestamp NOT NULL, -- 생성일시
                            idx            varchar(20) not null,
                            pt_nm          varchar(50),
                            pt_brdy_dt     varchar(50),
                           CONSTRAINT cncr_rgst_pk PRIMARY KEY (idx)
);

CREATE TABLE IF NOT EXISTS GSTR.CNCR_RGST_UPDATED (
                                   idx varchar(20) null,-- 추가 시퀀스용
                                   hosp_cd varchar(4) NOT NULL, 			-- 병원번호
                                   pt_no varchar(15) NOT NULL, 		-- 환자등록번호 ptno -> pt_no 변경
                                   fdx varchar(8) NULL, 				-- 초진연월일
                                   brth varchar(6) NULL, 				-- 생년월
                                   age varchar(3) NULL, 				-- 나이
                                   sex varchar(20) NULL, 				-- 성별
                                   popcode varchar(20) NULL, 			-- 모집단구분코드
                                   popname varchar(50) NULL, 			-- 모집단구분명
                                   frgcode varchar(20) NULL, -- 외국인코드
                                   frgname varchar(50) NULL, -- 외국인명
                                   hmlscode varchar(20) NULL, -- 행려환자
                                   hmlsname varchar(50) NULL, -- 행려환자
                                   jobcode varchar(20) NULL, -- 직업분류코드
                                   jobname varchar(50) NULL, -- 직업분류명
                                   job1 varchar(50) NULL, -- 직업분류기타
                                   unknownjob varchar(50) NULL, -- 직업상세설명
                                   visitpathcode varchar(20) NULL, -- 진단경로코드
                                   visitpathname varchar(50) NULL, -- 진단경로명
                                   visitpath_desc varchar(50) NULL, -- 진단경로5세부설명
                                   tcode varchar(20) NULL, -- 원발부위코드
                                   tcode1 varchar(50) NULL, -- 원발부위코드설명
                                   tcode2 varchar(50) NULL, -- 원발부위코드기타설명
                                   latercode varchar(20) NULL, -- 편측성코드
                                   latername varchar(100) NULL, -- 편측성명
                                   mcode varchar(20) NULL, -- 조직학적진단명코드
                                   mcode1 varchar(50) NULL, -- 조직학적진단명코드설명
                                   mcode2 varchar(50) NULL, -- 조직학적진단명코드기타설명
                                   bunhwadocode varchar(20) NULL, -- 분화도코드
                                   bunhwadoname varchar(50) NULL, -- 분화도명
                                   expire varchar(8) NULL, -- 사망연월일
                                   sain varchar(20) NULL, -- 사망원인
                                   methodcode varchar(20) NULL, -- 진단방법코드
                                   methodname varchar(100) NULL, -- 진단방법명
                                   method2 varchar(50) NULL, -- 진단방법 임상검사2세부사항
                                   methodetc varchar(50) NULL, -- 진단방법 임상검사2기타사항
                                   txcheckcode varchar(20) NULL, -- 치료 시행 여부코드
                                   txcheckname varchar(50) NULL, -- 치료시행여부명
                                   tx varchar(20) NULL, -- 요법
                                   txetc varchar(50) NULL, -- 기타치료
                                   recoyear varchar(50) NULL, -- 출생 연대 표기
                                   admisdate varchar(8) NULL, -- 입원일
                                   disdate varchar(8) NULL, -- 퇴원일
                                   dbyear varchar(4) NULL, -- 자료등록년도
                                   inputday varchar(8) NULL, -- 입력일
                                   seeryear varchar(4) NULL, -- SEERYEAR
                                   seercode varchar(20) NULL, -- SEERCODE
                                   seername varchar(100) NULL, -- SEERNAME
                                   stagecode varchar(20) NULL, -- STAGE코드
                                   stageyear varchar(4) NULL, -- STAGEYEAR
                                   stagedesc varchar(50) NULL, -- 병기STAGE
                                   metacode1 varchar(20) NULL, -- 원격전이코드1
                                   metacode2 varchar(20) NULL, -- 원격전이코드2
                                   metacode3 varchar(20) NULL, -- 원격전이코드3
                                   crtn_dt timestamp NOT NULL, -- 생성일시,
                                   CREATED_BY         CHARACTER VARYING(50),
                                   CREATED_DATE       TIMESTAMP,
                                   LAST_MODIFIED_BY   CHARACTER VARYING(50),
                                   LAST_MODIFIED_DATE TIMESTAMP,
                                   STATUS             VARCHAR(50)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9000, 'GSTR.CNCR_RGST', '위암_환자_정보', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (9000, null, '위암_환자_정보');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9000, 'pt_no', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, visible) values (9000,'환자번호', false, false, false);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9001, 'hosp_cd', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9001,'병원번호', true, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9002, 'fdx', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9002,'초진연월일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9002,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9003, 'brth', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9003,'생년월', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9004, 'age', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9004,'나이', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9005, 'sex', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9005,'성별', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9006, 'popcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9006,'모집단구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9006,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9007, 'popname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9007,'모집단구분명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9008, 'frgcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9008,'외국인코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9008,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9009, 'frgname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9009,'외국인명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9010, 'hmlscode', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9010,'행려환자', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9011, 'hmlsname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9011,'행려환자', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9012, 'jobcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9012,'직업분류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9012,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9013, 'jobname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9013,'직업분류명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9014, 'job1', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9014,'직업분류기타', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9015, 'unknownjob', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9015,'직업상세설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9016, 'visitpathcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9016,'진단경로코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9016,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9017, 'visitpathname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9017,'진단경로명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9018, 'visitpath_desc', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9018,'진단경로5세부설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9019, 'tcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9019,'원발부위코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9019,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9020, 'tcode1', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9020,'원발부위코드설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9021, 'tcode2', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9021,'원발부위코드기타설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9022, 'latercode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9022,'편측성코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9022,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9023, 'latername', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9023,'편측성명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9024, 'mcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9024,'조직학적진단명코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9024,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9025, 'mcode1', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9025,'조직학적진단명코드설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9026, 'mcode2', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9026,'조직학적진단명코드기타설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9027, 'bunhwadocode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9027,'분화도코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9027,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9028, 'bunhwadoname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9028,'분화도명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9029, 'expire', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9029,'사망연월일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9029,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9030, 'sain', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9030,'사망원인', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9031, 'methodcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9031,'진단방법코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9031,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9032, 'methodname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9032,'진단방법명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9033, 'method2', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9033,'진단방법 임상검사2세부사항', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9034, 'methodetc', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9034,'진단방법 임상검사2기타사항', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9035, 'txcheckcode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9035,'치료 시행 여부코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9035,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9036, 'txcheckname', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9036,'치료시행여부명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9037, 'tx', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9037,'요법', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9038, 'txetc', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9038,'기타치료', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9039, 'recoyear', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9039,'출생 연대 표기', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9040, 'admisdate', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9040,'입원일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9040,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9041, 'disdate', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9041,'퇴원일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9041,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9042, 'dbyear', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9042,'자료등록년도', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9043, 'inputday', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9043,'입력일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9043,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9044, 'seeryear', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9044,'SEERYEAR', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9045, 'seercode', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9045,'SEERCODE', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9046, 'seername', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9046,'SEERNAME', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9047, 'stagecode', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (9047,'STAGE코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (9047,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (9048, 'stageyear', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9048,'STAGEYEAR', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9049, 'stagedesc', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9049,'병기STAGE', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9050, 'metacode1', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9050,'원격전이코드1', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9051, 'metacode2', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9051,'원격전이코드2', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (9052, 'metacode3', '', true, 9000, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (9052,'원격전이코드3', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (9053, 'crtn_dt', '', true, 9000, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (9053,'생성일시,', true, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (9053, 'date');
