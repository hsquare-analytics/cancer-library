CREATE TABLE CNCR_RGST (
                           idx varchar(20) null,-- 추가 시퀀스용
                           hoode varchar(4) NOT NULL, 			-- 병원번호
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
                           CONSTRAINT cncr_rgst_pk PRIMARY KEY (idx)
);

CREATE TABLE CNCR_RGST_UPDATED (
                                   idx varchar(20) null,-- 추가 시퀀스용
                                   hoode varchar(4) NOT NULL, 			-- 병원번호
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
VALUES (1001, 'CNCR_RGST', 'CNCR_RGST', true, 1, 999, 'system');

INSERT INTO ph_category_property (category_id, date_column, caption)
VALUES (1001, null, '위암_환자_정보');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1000, 'pt_no', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1000,'환자번호', false, false);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1001, 'hoode', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1001,'병원번호', true, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1002, 'fdx', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1002,'초진연월일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1002,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1003, 'brth', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1003,'생년월', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1004, 'age', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1004,'나이', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1005, 'sex', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1005,'성별', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1006, 'popcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1006,'모집단구분코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1006,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1007, 'popname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1007,'모집단구분명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1008, 'frgcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1008,'외국인코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1008,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1009, 'frgname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1009,'외국인명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1010, 'hmlscode', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1010,'행려환자', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1011, 'hmlsname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1011,'행려환자', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1012, 'jobcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1012,'직업분류코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1012,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1013, 'jobname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1013,'직업분류명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1014, 'job1', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1014,'직업분류기타', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1015, 'unknownjob', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1015,'직업상세설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1016, 'visitpathcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1016,'진단경로코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1016,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1017, 'visitpathname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1017,'진단경로명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1018, 'visitpath_desc', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1018,'진단경로5세부설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1019, 'tcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1019,'원발부위코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1019,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1020, 'tcode1', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1020,'원발부위코드설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1021, 'tcode2', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1021,'원발부위코드기타설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1022, 'latercode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1022,'편측성코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1022,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1023, 'latername', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1023,'편측성명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1024, 'mcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1024,'조직학적진단명코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1024,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1025, 'mcode1', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1025,'조직학적진단명코드설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1026, 'mcode2', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1026,'조직학적진단명코드기타설명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1027, 'bunhwadocode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1027,'분화도코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1027,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1028, 'bunhwadoname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1028,'분화도명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1029, 'expire', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1029,'사망연월일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1029,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1030, 'sain', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1030,'사망원인', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1031, 'methodcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1031,'진단방법코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1031,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1032, 'methodname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1032,'진단방법명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1033, 'method2', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1033,'진단방법 임상검사2세부사항', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1034, 'methodetc', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1034,'진단방법 임상검사2기타사항', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1035, 'txcheckcode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1035,'치료 시행 여부코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1035,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1036, 'txcheckname', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1036,'치료시행여부명', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1037, 'tx', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1037,'요법', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1038, 'txetc', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1038,'기타치료', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1039, 'recoyear', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1039,'출생 연대 표기', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1040, 'admisdate', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1040,'입원일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1040,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1041, 'disdate', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1041,'퇴원일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1041,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1042, 'dbyear', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1042,'자료등록년도', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1043, 'inputday', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1043,'입력일', false, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1043,'date');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1044, 'seeryear', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1044,'SEERYEAR', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1045, 'seercode', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1045,'SEERCODE', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1046, 'seername', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1046,'SEERNAME', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1047, 'stagecode', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing) values (1047,'STAGE코드', false, true);
insert into ph_item_attribute (item_id, data_type) values (1047,'selectbox');

insert into ph_item (id, title, description, activated, category_id, created_by) values (1048, 'stageyear', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1048,'STAGEYEAR', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1049, 'stagedesc', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1049,'병기STAGE', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1050, 'metacode1', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1050,'원격전이코드1', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1051, 'metacode2', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1051,'원격전이코드2', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by) values (1052, 'metacode3', '', true, 1001, 'system');
insert into ph_item_property (item_id, caption, required, allow_editing) values (1052,'원격전이코드3', false, true);

insert into ph_item (id, title, description, activated, category_id, created_by, codebook_id) values (1053, 'crtn_dt', '', true, 1001, 'system', 1);
insert into ph_item_property (item_id, caption, required, allow_editing, format) values (1053,'생성일시,', true, true, 'yyyy-MM-dd');
insert into ph_item_attribute (item_id, data_type) values (1053, 'date');
