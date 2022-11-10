insert into ph_codebook (id, title, created_by) values ('10020','결혼상세코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','결혼상세코드','1','미혼','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','결혼상세코드','2','기혼','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','결혼상세코드','3','이혼','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','결혼상세코드','4','사별','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','결혼상세코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('10030','암종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','01','뇌','1','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','02','위','2','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','03','폐','3','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','04','간','4','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','05','대장','5','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','06','유방','6','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','07','자궁','7','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','08','전립선','8','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','09','갑상선','9','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','10','난소','10','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','11','췌장','11','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','12','담도','12','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','13','혈액','13','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','14','골육종','14','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','15','구강','15','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','16','신장','16','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','암종류코드','99','기타','17','17'),

insert into ph_codebook (id, title, created_by) values ('10040','여부무응답구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','여부무응답구분코드','Y','예','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','여부무응답구분코드','N','아니오','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','여부무응답구분코드','Z','무응답','3','3'),

insert into ph_codebook (id, title, created_by) values ('10050','음주종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','01','맥주','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','02','소주','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','03','양주','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','04','막걸리','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','08','무응답','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','음주종류코드','09','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('10060','퇴원상태코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','01','호전','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','02','악화','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','03','호전안됨','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','04','진단뿐','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','05','가망없는퇴원','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','06','사망','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','퇴원상태코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('10070','환자가족관계코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','01','아버지','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','02','어머니','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','03','자녀','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','04','형제자매','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','05','친척','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','98','무응답','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','환자가족관계코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('20010','ECOG코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','01','제한없이 정상적이다','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','02','증상이 있으나 스스로 활동 가능하다','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','03','증상이 있으나 누워 지내는 시간은 하루의 반보다 적다','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','04','증상이 있으며 누워 지내는 시간이 하루의 절반이상이다','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','05','계속 누워 있어야 한다','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','ECOG코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('20030','수술후합병증분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20030','수술후합병증분류코드','1','Local complication','1','2'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20030','수술후합병증분류코드','2','Systemic complication','2','2'),

insert into ph_codebook (id, title, created_by) values ('20040','수술후합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','01','Intra-abdominal fluid collection','1','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','02','Intra-abdominal bleeding','2','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','03','Intraluminal bleeding','3','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','04','Intestinal obstruction (=ileus)','4','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','05','Anastomotic leakage','5','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','06',' Chylous ascites','6','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','07','Duodenal stump leakage','7','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','08','Anastomotic stricture','8','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','09','pancreatic leakage','9','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','10','Delayed gastric emptying (= gastric stasis)','10','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','11','Wound complication','11','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','12','Respiratory complications','12','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','13','Cardiovascular complications','13','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','14','Central nervous system complications','14','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','15','Urinary system complications','15','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','16','Hepatic system complications','16','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','17','Endocrine system complications','17','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','수술후합병증코드','99','기타','18','18'),

insert into ph_codebook (id, title, created_by) values ('20050','임상종양특성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','임상종양특성코드','1','Primary','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','임상종양특성코드','2','Remnant','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','임상종양특성코드','3','Meta','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','임상종양특성코드','9','기타  ','4','4'),

insert into ph_codebook (id, title, created_by) values ('20060','전이부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','01','Breast(OP site)','1','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','02','Breast(non-OP site)','2','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','03','LN','3','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','04','Lung','4','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','05','Liver','5','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','06','Brain','6','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','07','Bone','7','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','08','Ovary','8','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','09','Peritoneum','9','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','전이부위코드','99','기타','10','10'),

insert into ph_codebook (id, title, created_by) values ('20070','전이양상코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','전이양상코드','1','single lesion','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','전이양상코드','2','multiple lesion - synchronous','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','전이양상코드','3','multiple lesion - metachronous','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','전이양상코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('20080','전이진단방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','전이진단방법코드','1','영상검사','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','전이진단방법코드','2','조직검사','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','전이진단방법코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('20090','전이치료코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','전이치료코드','00000','No','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','전이치료코드','10000','Chemotherapy','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','전이치료코드','01000','Operation','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','전이치료코드','00100','Radiotherapy','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','전이치료코드','00001','Other','5','5'),

insert into ph_codebook (id, title, created_by) values ('20100','진단종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','01','위암(C16)','1','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','02','대장암(C18)','2','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','03','간암(C22)','3','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','04','담도암(C24)','4','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','05','췌장암(C25)','5','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','06','폐암(C34)','6','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','07','유방암(C50)','7','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','08','난소암(C56)','8','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','09','전립선(C61)','9','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','10','신장암(C64)','10','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','11','갑상선암(C73)','11','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','98','기타암(모집단 이외 C Code)','12','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','진단종류코드','99','기타질환','13','13'),

insert into ph_codebook (id, title, created_by) values ('20120','합병증등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','01','Grade 1','1','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','02','Grade 2','2','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','03','Grade 3','3','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','04','Grade 3a','4','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','05','Grade 3b','5','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','06','Grade 5','6','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','07','Grade 4','7','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','08','Grade 4a','8','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','합병증등급코드','09','Grade 4b','9','9'),

insert into ph_codebook (id, title, created_by) values ('30010','DNA변이정보B코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','DNA변이정보B코드','1','A>','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','DNA변이정보B코드','2','G>','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','DNA변이정보B코드','3','T>','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','DNA변이정보B코드','4','C>','4','4'),

insert into ph_codebook (id, title, created_by) values ('30020','DNA변이정보C코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','01','A','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','02','G','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','03','C','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','04','T','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','05','ins','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','06','del','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','07','dup','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','DNA변이정보C코드','08','Unknown','8','8'),

insert into ph_codebook (id, title, created_by) values ('30030','EUS_M병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','EUS_M병기코드','1','MX','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','EUS_M병기코드','2','M0','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','EUS_M병기코드','3','M1','3','3'),


insert into ph_codebook (id, title, created_by) values ('30040','EUS_N병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','EUS_N병기코드','1','NX','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','EUS_N병기코드','2','N0','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','EUS_N병기코드','3','N(+)','3','3'),

insert into ph_codebook (id, title, created_by) values ('30050','EUS_T병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','01','TX','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','02','T1a','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','03','T1b','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','04','T2','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','05','T3','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','06','T4a','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','EUS_T병기코드','07','T4b','7','7'),

insert into ph_codebook (id, title, created_by) values ('30060','EUS합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','EUS합병증코드','1','None','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','EUS합병증코드','2','bleeding','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','EUS합병증코드','3','perforation','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','EUS합병증코드','4','Mallory-weiss tearing','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','EUS합병증코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30070','GROSS유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','01','EGC-I','1','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','02','EGC-IIa','2','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','03','EGC-IIb','3','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','04','EGC-IIc','4','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','05','EGC-III','5','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','06','AGC-Bormann type 4','6','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','07','AGC-Bormann type 1','7','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','08','AGC-Bormann type 2','8','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','09','AGC-Bormann type 3','9','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','10','AGC-Bormann type 5','10','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','11','Combination','11','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','GROSS유형코드','99','기타/Unclassifiable','12','12'),

insert into ph_codebook (id, title, created_by) values ('30080','HPYLORI검사결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','HPYLORI검사결과코드','1','Negative','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','HPYLORI검사결과코드','2','Positive','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','HPYLORI검사결과코드','3','not evaluable','3','3'),

insert into ph_codebook (id, title, created_by) values ('30090','HPYLORI검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','HPYLORI검사방법코드','1','Rapid urease test(CLO test)','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','HPYLORI검사방법코드','2','Urea Breath Test','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','HPYLORI검사방법코드','3','Histology(병리검사)','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','HPYLORI검사방법코드','4','H.pylori IgG Ab','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','HPYLORI검사방법코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30120','감지여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','감지여부구분코드','Y','Detected','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','감지여부구분코드','N','Not detected','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','감지여부구분코드','Z','Unknown','3','3'),

insert into ph_codebook (id, title, created_by) values ('30130','동반병변코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','01','Microcalcification','1','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','02','Foreign body reaction','2','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','03','Usual ductal hyperplasia','3','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','04','Stromal degeneration','4','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','05','Sclerosing adenosis','5','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','06','Mucinous component','6','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','07','Intraductal papilloma','7','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','08','Stromal fibrosis','8','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','09','Apocrine differentiation','9','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','10','Apocrine metaplasia','10','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','11','Foamy histiocytic collection','11','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','12','Fibroadenoma','12','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','13','Complex sclerosing lesion','13','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','14','Medullary feature','14','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','동반병변코드','99','기타','15','15'),

insert into ph_codebook (id, title, created_by) values ('30140','면역병리검사결과단위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30140','면역병리검사결과단위코드','1','Score','1','2'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30140','면역병리검사결과단위코드','2','%','2','2'),

insert into ph_codebook (id, title, created_by) values ('30150','면역병리검사소견분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','01','Positive','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','02','Negative','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','03','Equivocal','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','04','Not evaluable ','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','05','Needle biopsy','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','06','Endoscopic biopsy','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','07','Excision','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','면역병리검사소견분류코드','99','기타','8','8'),

insert into ph_codebook (id, title, created_by) values ('30160','면역병리검사소견코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','01','Positive','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','02','Negative','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','03',' Focal positive','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','04','Equivocal','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','05','Not evaluable','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','면역병리검사소견코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('30170','면역병리검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','01','hMLH1','1','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','02','hMSH2','2','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','03','MSH6','3','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','04','PMS2','4','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','05','HER2(=C-erbB2)','5','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','06','p53','6','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','07','EGFR','7','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','08','PD-L1','8','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','09','EBV','9','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','10','ER','10','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','11','PR','11','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','12','HER2','12','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','13','Ki67','13','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','14','CK5/6','14','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','15','AR','15','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','16','TIL','16','17'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','면역병리검사종류코드','99','기타','17','17'),

insert into ph_codebook (id, title, created_by) values ('30190','분자병리검사결과종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','분자병리검사결과종류코드','1','검사한 종양 세포의 핵 개수','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','분자병리검사결과종류코드','2','핵당 HER2 평균수','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','분자병리검사결과종류코드','3','핵당 CEP17 평균수','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','분자병리검사결과종류코드','4','HER2/CEP17 비율','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','분자병리검사결과종류코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30200','분자병리검사결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','분자병리검사결과코드','1','Positive','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','분자병리검사결과코드','2','Negative','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','분자병리검사결과코드','3','Equivocal','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','분자병리검사결과코드','4','Not evaluable ','4','4'),

insert into ph_codebook (id, title, created_by) values ('30210','분자병리검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30210','분자병리검사방법코드','1','SISH','1','2'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30210','분자병리검사방법코드','2','FISH','2','2'),

insert into ph_codebook (id, title, created_by) values ('30220','분자병리검사소견코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','분자병리검사소견코드','1','Positive','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','분자병리검사소견코드','2','Negative','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','분자병리검사소견코드','3','Equivocal','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','분자병리검사소견코드','4','Not evaluable','4','4'),

insert into ph_codebook (id, title, created_by) values ('30230','분자병리검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','분자병리검사종류코드','1','Microsatellite instability(MSI)','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','분자병리검사종류코드','2','HER-2','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','분자병리검사종류코드','3','EBV ISH','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','분자병리검사종류코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('30250','상피내암핵등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','01','Gx','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','02','G1','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','03','G2','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','04','G3','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','05','low','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','06','intermediate','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','07','high','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','상피내암핵등급코드','99','기타','8','8'),

insert into ph_codebook (id, title, created_by) values ('30260','생식세포변이검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','생식세포변이검사방법코드','1','Sanger sequencing','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','생식세포변이검사방법코드','2','NGS','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','생식세포변이검사방법코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('30270','생식세포변이검사유전자종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','생식세포변이검사유전자종류코드','1','BRCA1','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','생식세포변이검사유전자종류코드','2','BRCA2','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','생식세포변이검사유전자종류코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('30290','생체검사방법종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','01','Biopsy','1','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','02','Computed tomography and biopsy','2','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','03','Laparoscopic biopsy','3','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','04','Needle biopsy','4','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','05','Endoscopic biopsy','5','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','06','Excision','6','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','07','Percutaneous liver biopsy','7','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','08','Surgical biopsy','8','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','09','Transjugular biopsy','9','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','10','Transjugular biopsy using fluoroscopic guidance','10','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','11','Ultrasound scan and biopsy','11','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','12','Wedge biopsy','12','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','13','Vacuum Assisted Breast Biopsy(MMT)','13','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','14','Gun biopsy','14','15'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','생체검사방법종류코드','99','기타','15','15'),

insert into ph_codebook (id, title, created_by) values ('30310','생체검사부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','01','Breast','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','02','LN','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','03','Chest','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','04','Stomach','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','05','Liver','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','06','Lung','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','07','Brain','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','생체검사부위코드','99','기타','8','8'),

insert into ph_codebook (id, title, created_by) values ('30320','생체검사부위편측성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','생체검사부위편측성코드','1','Left','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','생체검사부위편측성코드','2','Right','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','생체검사부위편측성코드','3','Bilateral','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','생체검사부위편측성코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('30330','수술절제면잔존코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','수술절제면잔존코드','1','R0','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','수술절제면잔존코드','2','R1','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','수술절제면잔존코드','3','R2','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','수술절제면잔존코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('30340','수술후둘레방향종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','01','Lesser curvature','1','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','02','Greater curvature','2','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','03','Anterior wall','3','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','04','Posterior wall','4','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','05','Encircling','5','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','06','Cardia','6','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','07','Fundus','7','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','08','Body','8','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','09','Angle','9','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','10','Antrum','10','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','11','Pylorus','11','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','12','Esophagus','12','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','13','Upper (EGJ 포함)','13','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','14','Middle','14','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','15','Lower','15','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','16','Duodenum','16','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','17','Entire (Whole)','17','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','수술후둘레방향종양위치코드','99','기타','18','18'),

insert into ph_codebook (id, title, created_by) values ('30350','아미노산변이정보A코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','01','Ala(A)','1','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','02','Arg(R)','2','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','03','Asn(N)','3','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','04','Asp(D)','4','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','05','Cys(C)','5','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','06','His(H)','6','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','07','Gly(G)','7','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','08','Glu(E)','8','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','09','Gln(Q)','9','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','10','Ile(I)','10','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','11','Leu(L)','11','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','12','Lys(K)','12','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','13','Met(M)','13','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','14','Ser(S)','14','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','15','Thr(T)','15','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','16','Trp(W)','16','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','17','Tyr(Y)','17','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','18','Phe(F)','18','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','19','Pro(P)','19','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','20','Val(V)','20','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','아미노산변이정보A코드','99','기타','21','21'),

insert into ph_codebook (id, title, created_by) values ('30360','아미노산변이정보C코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','01','Ala(A)','1','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','02','Arg(R)','2','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','03','Asn(N)','3','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','04','Asp(D)','4','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','05','Cys(C)','5','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','06','His(H)','6','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','07','Gly(G)','7','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','08','Glu(E)','8','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','09','Gln(Q)','9','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','10','Ile(I)','10','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','11','Leu(L)','11','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','12','Lys(K)','12','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','13','Met(M)','13','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','14','Ser(S)','14','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','15','Thr(T)','15','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','16','Trp(W)','16','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','17','Tyr(Y)','17','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','18','Phe(F)','18','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','19','Pro(P)','19','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','20','Val(V)','20','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','21','fs(Frame shift)','21','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','22','dup','22','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','23','del','23','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','24','ins','24','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','25','*(Ter/Stop)','25','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','아미노산변이정보C코드','99','기타','26','26'),

insert into ph_codebook (id, title, created_by) values ('30370','양성여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','양성여부구분코드','Y','Positive','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','양성여부구분코드','N','Negative','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','양성여부구분코드','Z','Indeterminate','3','3'),

insert into ph_codebook (id, title, created_by) values ('30380','여부확인불가구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','여부확인불가구분코드','Y','Yes','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','여부확인불가구분코드','N','No','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','여부확인불가구분코드','Z','Unknown','3','3'),

insert into ph_codebook (id, title, created_by) values ('30400','영상검사결과진단적분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','01','negative','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','02','benign','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','03','probably benign','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','04','suspicous','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','05','highly suggestive','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','06','proven malignancy','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','영상검사결과진단적분류코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('30410','영상검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','01','MMG','1','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','02','DBT','2','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','03','SONO','3','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','04','PET','4','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','05','MRI','5','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','06','CT','6','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','07','Dexa','7','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','08','X-ray','8','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','09','Bone scan','9','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','영상검사종류코드','99','기타','10','10'),

insert into ph_codebook (id, title, created_by) values ('30430','외과병리채취부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','외과병리채취부위코드','1','Breast','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','외과병리채취부위코드','2','Stomach','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','외과병리채취부위코드','3','LN','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','외과병리채취부위코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('30440','위내시경검사결과유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','01','EGC-I','1','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','02','EGC-IIa','2','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','03','EGC-IIb','3','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','04','EGC-IIc','4','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','05','EGC-III','5','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','06','AGC-Bormann type 4','6','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','07','AGC-Bormann type 1','7','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','08','AGC-Bormann type 2','8','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','09','AGC-Bormann type 3','9','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','10','AGC-Bormann type 5','10','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','11','Combination','11','12'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','위내시경검사결과유형코드','99','기타/Unclassifiable','12','12'),

insert into ph_codebook (id, title, created_by) values ('30450','위내시경검사목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','01','진단','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','02','내시경 시술 및 추적검사','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','03','수술후 추적검사','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','04','공단검진','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','05','암예방검진센터 수검자','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','위내시경검사목적코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('30460','위내시경합병증등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','01','0','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','02','I','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','03','II','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','04','IIIa','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','05','IV','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','06','V','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','위내시경합병증등급코드','07','Not available','7','7'),

insert into ph_codebook (id, title, created_by) values ('30470','위내시경합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','위내시경합병증코드','1','None','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','위내시경합병증코드','2','bleeding','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','위내시경합병증코드','3','perforation','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','위내시경합병증코드','4','Mallory-weiss tearing','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','위내시경합병증코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30480','위식도경계부위암분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','위식도경계부위암분류코드','1','Type I','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','위식도경계부위암분류코드','2','Type II','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','위식도경계부위암분류코드','3','Type III','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','위식도경계부위암분류코드','4','해당없음','4','4'),

insert into ph_codebook (id, title, created_by) values ('30490','유방밀도분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','유방밀도분류코드','1','fatty breast','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','유방밀도분류코드','2','scattered fibroglandular','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','유방밀도분류코드','3','heterogeneously dense','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','유방밀도분류코드','4','extremely dense ','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','유방밀도분류코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30500','유전자발현검사결과종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','유전자발현검사결과종류코드','01','EPclin score','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','유전자발현검사결과종류코드','02','Risk Assessment','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','유전자발현검사결과종류코드','03','Mammaprint Index','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','유전자발현검사결과종류코드','04','Risk-of-Recurrence Result','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','유전자발현검사결과종류코드','05','Oncotype Recurrence Score (RS)','5','5'),

insert into ph_codebook (id, title, created_by) values ('30510','유전자발현검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','01','Oncotype Dx','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','02','Mammaprint','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','03','Endopredict','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','04','BCI','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','05','GenesWell BCT','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','06','Oncofree','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','유전자발현검사종류코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('30520','조직학적등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','조직학적등급코드','1','Gx','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','조직학적등급코드','2','G1','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','조직학적등급코드','3','G2','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','조직학적등급코드','4','G3 ','4','4'),

insert into ph_codebook (id, title, created_by) values ('30530','조직학적분화도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','조직학적분화도코드','1','Well differentiated','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','조직학적분화도코드','2','Moderately differentiated','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','조직학적분화도코드','3','Poorly differentiated','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','조직학적분화도코드','4','Combined','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','조직학적분화도코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('30540','조직학적진단코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','01','Adenosquamous carcinoma','1','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','02','Carcinoma with lymphoid stroma','2','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','03','DCIS ; Ductal carcinoma in situ','3','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','04','Gastrointestinal stromal tumor','4','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','05','Hepatoid adenocarcinoma','5','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','06','ILC ;Invasive lobular carcinoma','6','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','07','Invasive ductal carcinoma ;IDC, micro IDC','7','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','08','LCIS ; Lobular carcinoma in situ','8','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','09','Lymphoma','9','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','10','Malignant Phyllodes tumor','10','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','11','Medullary carcinoma','11','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','12','Metaplastic carcinoma','12','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','13','Mixed adenocarcinoma','13','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','14','Mucinous adenocarcinoma','14','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','15','Mucinous carcinoma','15','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','16','Neuroendocrine tumor','16','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','17','Paget''s disease','17','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','18','Papillary adenocarcinoma','18','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','19','Papillary carcinoma','19','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','20','Poorly cohesive carcinoma(signet ring cell carcinoma 포함)','20','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','21','Sarcoma','21','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','22','Squamous cell carcinoma','22','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','23','Tubular adenocarcinoma','23','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','24','Tubular carcinoma','24','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','25','Undifferentiated carcinoma','25','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','조직학적진단코드','99','기타','26','26'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','존재여부구분코드','Y','Present','1','3'),

insert into ph_codebook (id, title, created_by) values ('30550','존재여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','존재여부구분코드','N','Absent','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','존재여부구분코드','Z','Not evaluable','3','3'),

insert into ph_codebook (id, title, created_by) values ('30560','종양코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','01','No residual','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','02','CIS only','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','03','Residual breast tumor','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','04','Residual LN meta','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','05','Residual breast tumor and LN meta','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','종양코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('30580','진단검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','01','Albumin','1','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','02','Alkaline Phosphatase','2','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','03','ALT ','3','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','04','ANC','4','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','05','Basophil','5','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','06','CA 15-3','6','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','07','CA-125','7','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','08','CA19-9','8','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','09','CA72-4','9','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','10','Calcium','10','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','11','CEA','11','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','12','Creatinine','12','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','13','CRP','13','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','14','E2','14','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','15','Eosinophil','15','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','16','Ferritin','16','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','17','FSH','17','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','18','Glucose','18','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','19','Hb','19','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','20','Hematocrit','20','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','21','Hemoglobin','21','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','22','Iron','22','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','23','Lymphocyte','23','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','24','Monocyte','24','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','25','Neutrophil','25','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','26','Platelets','26','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','27','Protein','27','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','28','RBC ','28','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','29','TIBC','29','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','30','Total Cholesterol','30','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','31','Vitamin B12','31','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','32','WBC','32','33'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','진단검사종류코드','99','기타','33','33'),

insert into ph_codebook (id, title, created_by) values ('30600','침습장기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','01','Colon','1','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','02','Spleen','2','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','03','Pancreas','3','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','04','Liver','4','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','05','Mesocolon','5','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','06','Adrenal gland','6','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','07','Diaphragm','7','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','08','Abdominal wall','8','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','09','Gallbladder','9','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','10','Retroperitoneum','10','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','침습장기코드','99','기타','11','11'),

insert into ph_codebook (id, title, created_by) values ('30610','침윤정도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','01','Mucosa','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','02','Submucosa','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','03','Proper muscle','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','04','Subseroca','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','05','Serosa','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','06','Adjacent organ','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','침윤정도코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('30620','편측성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','편측성코드','1','Left','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','편측성코드','2','Right','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','편측성코드','3','Bilateral','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','편측성코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('30630','포함여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','포함여부구분코드','Y','Involved','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','포함여부구분코드','N','Not involved','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','포함여부구분코드','Z','No data','3','3'),

insert into ph_codebook (id, title, created_by) values ('40010','ASA점수코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','01','정상의 건강한 환자','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','02','경도의 전신 질환을 가진 환자','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','03','중등도의 중증 전신질환을 가진 환자','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','04','지속적으로 생명을 위협하는 중증의 전신질환을 가진 환자','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','05','수술하지 않으면 생명을 유지할 수 없는 정도의 중증질환을 가진 환자','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','ASA점수코드','99','장기 공여를 위한 수술 예정인 뇌사자','6','6'),

insert into ph_codebook (id, title, created_by) values ('40020','ESD결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','ESD결과코드','1','En bloc resection','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','ESD결과코드','2','Piecemeal resection','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','ESD결과코드','3','Failure','3','3'),

insert into ph_codebook (id, title, created_by) values ('40030','ESD병변모양코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','ESD병변모양코드','1','Elevated (I, IIa, IIa+IIc)','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','ESD병변모양코드','2','flat (IIb)','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','ESD병변모양코드','3','depressed  (IIc)','3','3'),

insert into ph_codebook (id, title, created_by) values ('40040','ESD병변위치가로코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','ESD병변위치가로코드','1','Lessor curvature','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','ESD병변위치가로코드','2','Greater curvature','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','ESD병변위치가로코드','3','Posterior wall','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','ESD병변위치가로코드','4','Anterior wall','4','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','ESD병변위치세로코드','01','Antrum','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','ESD병변위치세로코드','02','Angle','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','ESD병변위치세로코드','03','Lowerbody','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','ESD병변위치세로코드','04','Midbody','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','ESD병변위치세로코드','05','Upperbody or cardia','5','5'),

insert into ph_codebook (id, title, created_by) values ('40060','ESD천공조치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','ESD천공조치코드','1','수술','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','ESD천공조치코드','2','내시경적치료 (clipping)','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','ESD천공조치코드','3','내시경치료 없이 보존치료 (산소투여 등)','3','3'),

insert into ph_codebook (id, title, created_by) values ('40080','감시림프절검출방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','감시림프절검출방법코드','1','Radioisotope','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','감시림프절검출방법코드','2','ICG','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','감시림프절검출방법코드','3','Indigocarmine','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','감시림프절검출방법코드','4','Dye','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','감시림프절검출방법코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('40090','그물막절제범위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','그물막절제범위코드','1','Total','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','그물막절제범위코드','2','Partial','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','그물막절제범위코드','3','Not done','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','그물막절제범위코드','4','Not applicable','4','4'),

insert into ph_codebook (id, title, created_by) values ('40100','근치도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','근치도코드','1','R0 resection','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','근치도코드','2','R1 resection','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','근치도코드','3','R2 resection','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','근치도코드','4','Not applicable','4','4'),

insert into ph_codebook (id, title, created_by) values ('40110','림프절절제정도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','01','<D1','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','02','D1','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','03','D1+','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','04','D2','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','05','D2+','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','06','Sentinel basin dissection','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','07','none','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','림프절절제정도코드','99','기타','8','8'),

insert into ph_codebook (id, title, created_by) values ('40130','방사선치료목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','방사선치료목적코드','1','Curative','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','방사선치료목적코드','2','Palliative','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','방사선치료목적코드','3','Adjuvant','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','방사선치료목적코드','4','Neoadjuvant','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','방사선치료목적코드','9','Other','5','5'),

insert into ph_codebook (id, title, created_by) values ('40140','방사선치료부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','01','Breast','1','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','02','LN','2','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','03','Stomach','3','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','04','Distant lymph node','4','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','05','Bone','5','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','06','Brain','6','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','07','abdomen wall','7','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','08','Lung','8','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','09','Liver','9','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','10','Boost','10','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','방사선치료부위코드','99','기타','11','11'),

insert into ph_codebook (id, title, created_by) values ('40150','방사선치료부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','방사선치료부작용등급코드','01','Grade 1','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','방사선치료부작용등급코드','02','Grade 2','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','방사선치료부작용등급코드','03','Grade 3','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','방사선치료부작용등급코드','04','Grade 4','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','방사선치료부작용등급코드','05','Grade 5','5','5'),

insert into ph_codebook (id, title, created_by) values ('40160','방사선치료부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40160','방사선치료부작용시기구분코드','1','급성(3개월 이내)','1','2'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40160','방사선치료부작용시기구분코드','2','만성(3개월 초과)','2','2'),

insert into ph_codebook (id, title, created_by) values ('40170','방사선치료부작용종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','01','Skin irritation','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','02','Aches','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','03','Fatigue','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','04','Heart damage','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','05','Radiation pneumonitis','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','방사선치료부작용종류코드','06','Swelling of  breast','6','6'),

insert into ph_codebook (id, title, created_by) values ('40180','방사선치료종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','01','체외조사','1','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','02','체부 정위적 방사선수술','2','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','03','정위적 방사선 분할치료','3','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','04','전신조사','4','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','05','입체조형치료','5','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','06','뇌 정위적 방사선수술','6','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','07','양성자 치료','7','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','08','세기변조 방사선치료','8','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','09','밀봉소선원치료','9','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','방사선치료종류코드','99','기타','10','10'),

insert into ph_codebook (id, title, created_by) values ('40200','방사선치료평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','01','CR','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','02','PR','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','03','PD','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','04','SD','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','05','NE','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','방사선치료평가항목코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40230','수술둘레방향종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','01','Lesser curvature','1','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','02','Greater curvature','2','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','03','Anterior wall','3','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','04','Posterior wall','4','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','05','Encircling','5','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','06','Cardia','6','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','07','Fundus','7','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','08','Body','8','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','09','Angle','9','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','10','Antrum','10','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','11','Pylorus','11','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','12','Esophagus','12','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','13','Upper (EGJ 포함)','13','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','14','Middle','14','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','15','Lower','15','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','16','Duodenum','16','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','17','Entire (Whole)','17','18'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','수술둘레방향종양위치코드','99','기타','18','18'),

insert into ph_codebook (id, title, created_by) values ('40240','수술마취부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','01','전신','1','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','02','척추','2','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','03','경막외','3','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','04','척추+경막외','4','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','05','신경차단','5','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','06','정맥','6','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','07','MAC','7','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','08','국소','8','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','수술마취부위코드','99','기타','9','9'),

insert into ph_codebook (id, title, created_by) values ('40250','수술목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','수술목적코드','1','Curative','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','수술목적코드','2','Palliative','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','수술목적코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('40260','수술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','01','내시경 복강경 협력 수술','1','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','02','복강경보조','2','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','03','전복강경 (다공, multi-port)','3','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','04','전복강경 (단일공, single port)','4','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','05','개복','5','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','06','로봇-다공','6','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','07','로봇-단일공','7','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','08','로봇 보조','8','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','수술방법코드','99','기타','9','9'),

insert into ph_codebook (id, title, created_by) values ('40270','수술부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','수술부위코드','1','Breast','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','수술부위코드','2','LN','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','수술부위코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('40280','수술시항암요법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','01','No','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','02','IP chemo','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','03','HIPEC','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','04','LHIPEC','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','05','PIPAC','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','수술시항암요법코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40290','수술절개방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','01','Upper midline','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','02','Rt upper transverse incision & multi-ports','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','03','Short upper midline & multi-ports','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','04','Umbilical incision & multi-ports','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','05','Single port/ single incision','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','수술절개방법코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40300','수술절개선유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','01','Periareolar','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','02','Radial','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','03','Curved linear','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','04','Elliptical','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','05','Inframammary','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','수술절개선유형코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40310','수술종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','01','Total gastrectomy','1','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','02','Distal gastrectomy','2','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','03','Proximal gastrectomy','3','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','04','Pylorus preserving gastrectomy','4','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','05','Segmental resection','5','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','06','Wedge resection','6','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','07','Open and closure with biopsy','7','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','08','Partial Mastectomy','8','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','09','Breast conserving surgery','9','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','10','Local excision of lesion of breast','10','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','11','Mastectomy With Axillary L/N Dissection','11','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','12','Mastectomy Without Axillary L/N Dissection','12','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','13','Lumpectomy','13','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','14','Resection of quadrant of breast','14','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','15','Simple Mastectomy','15','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','16','Subcutaneous Mastectomy','16','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','17','Modified radical mastectomy','17','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','18','Skin sparing mastectomy','18','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','19','Axillary Sentinel Lymph Node Excision','19','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','20','Dissection of  Axillary Lymph Node','20','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','21','Excision or destruction of breast tissue','21','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','22','Reduction Mammoplasty','22','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','23','Other Mammoplasty','23','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','24','Augmentation Mammoplasty','24','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','25','Immediate Implant Insertion Following Mastectomy','25','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','26','Breast Reconstruction','26','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','27','Revision of implant of breast','27','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','28','Musculocutaneous Flap','28','29'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','수술종류코드','99','기타','29','29'),

insert into ph_codebook (id, title, created_by) values ('40320','수술종양상세위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','01','Upper outer','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','02','Upper inner','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','03','Lower outer','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','04','Lower inner','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','05','Central','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','수술종양상세위치코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40330','수술종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','수술종양위치코드','1','Left','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','수술종양위치코드','2','Right','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','수술종양위치코드','3','Bilateral','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','수술종양위치코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('40350','수술후평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','01','CR','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','02','PR','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','03','PD','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','04','SD','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','05','NE','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','수술후평가항목코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40380','약제구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','01','세포독성약제','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','02','항암표적약제','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','03','항암내분비약제','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','04','항암면역약제','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','05','기타항암약제','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','약제구분코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40390','약제분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40390','약제분류코드','1','항암약제','1','2'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40390','약제분류코드','9','기타약제','2','2'),

insert into ph_codebook (id, title, created_by) values ('40400','약제성분종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','01','capecitabine','1','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','02','cisplatin','2','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','03','docetaxel','3','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','04','doxorubicin','4','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','05','epirubicin','5','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','06','etoposide','6','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','07','fluorouracil','7','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','08','Tegafur/gimeracil/oteracil(S-1)','8','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','09','irinotecan hydrochloride','9','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','10','oxaliplatin','10','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','11','paclitaxel','11','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','12','carboplatin','12','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','13','methotrexate','13','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','14','mitomycin C','14','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','15','Trifluridine-tipiracil','15','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','16','ramucirumab','16','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','17','trastuzumab','17','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','18','nivolumab','18','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','19','pembrolizumab','19','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','20','leucovorin','20','21'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','약제성분종류코드','99','기타','21','21'),

insert into ph_codebook (id, title, created_by) values ('40420','약제처방용량단위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','01','mg/kg','1','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','02','mg/m2','2','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','03','tab','3','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','04','AMP','4','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','05','g','5','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','06','mcg/kg','6','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','07','g/kg','7','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','08','g/m2','8','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','09','mcg','9','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','10','mcg/m2','10','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','11','mg','11','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','12','cap','12','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','13','dos','13','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','14','ea','14','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','15','g','15','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','16','ke','16','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','17','kit','17','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','18','mcg','18','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','19','mg','19','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','20','ml','20','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','21','pfu','21','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','22','pkg','22','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','23','set','23','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','24','unit','24','25'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','약제처방용량단위코드','99','기타','25','25'),

insert into ph_codebook (id, title, created_by) values ('40440','약제투여경로코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','01','경구','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','02','정맥내주사','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','03','근육주사','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','04','피하주사','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','05','피내주사','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','06','척수강내주사','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','약제투여경로코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('40450','유방암수술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','유방암수술방법코드','1','Opne','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','유방암수술방법코드','2','Endoscopic','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','유방암수술방법코드','3','Robotic','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','유방암수술방법코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('40460','재건술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','01','Stapler','1','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','02','Hand-sewing','2','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','03','Not applicable','3','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','04','TRAM/DIEP','4','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','05','Tissue expander','5','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','06','Direct to implant','6','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','07','LD flap','7','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','08','Vicryl mesh','8','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','09','Advanced glandular','9','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','재건술방법코드','99','기타','10','10'),

insert into ph_codebook (id, title, created_by) values ('40470','재건술분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','재건술분류코드','1','Immediate reconstruction','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','재건술분류코드','2','Delayed reconstruction','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','재건술분류코드','3','Oncoplastic','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','재건술분류코드','4','Not applicable','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','재건술분류코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('40480','재건술접근법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','재건술접근법코드','1','Intracorporeal','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','재건술접근법코드','2','Extracorporeal','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','재건술접근법코드','3','Not applicable','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','재건술접근법코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('40490','재건술종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','01','Billroth I','1','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','02','Billroth II','2','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','03','Roux-en-Y','3','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','04','Gastrogastrostomy','4','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','05','Esophagogastrostomy','5','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','06','Double tract method','6','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','07','Primary repair','7','8'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','재건술종류코드','99','기타','8','8'),

insert into ph_codebook (id, title, created_by) values ('40500','합병절제부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','01','None','1','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','02','Gall Baldder','2','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','03','Spleen','3','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','04','Pancreas','4','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','05','Colon','5','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','06','Liver','6','7'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','합병절제부위코드','99','기타','7','7'),

insert into ph_codebook (id, title, created_by) values ('40510','항암약제구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','항암약제구분코드','1','세포독성약제','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','항암약제구분코드','2','항암표적약제','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','항암약제구분코드','3','항암내분비약제','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','항암약제구분코드','4','항암면역약제','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','항암약제구분코드','9','기타항암약제','5','5'),

insert into ph_codebook (id, title, created_by) values ('40520','항암요법부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','항암요법부작용등급코드','01','I','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','항암요법부작용등급코드','02','II','2','5'),

insert into ph_codebook (id, title, created_by) values ('40520','항암요법부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','항암요법부작용등급코드','03','III','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','항암요법부작용등급코드','04','IV','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','항암요법부작용등급코드','05','V','5','5'),

insert into ph_codebook (id, title, created_by) values ('40530','항암요법부작용코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','01','Anorexia','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','02','Hand-foot syndrome','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','03','Nausea/vomiting','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','04','Alopecia','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','05','Dry skin','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','항암요법부작용코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40540','항암요법부작용항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','01','Anorexia','1','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','02','Hand-foot syndrome','2','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','03','Nausea/vomiting','3','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','04','Alopecia','4','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','05','Dry skin','5','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','06','Diarrhea','6','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','07','Leukopenia','7','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','08','Fatigue','8','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','09','Constipation','9','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','10','Skin rash','10','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','11','Mucositis','11','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','12','Neuropathy','12','13'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','항암요법부작용항목코드','99','기타','13','13'),

insert into ph_codebook (id, title, created_by) values ('40550','항암요법종료이유코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','항암요법종료이유코드','1','Tumor progression','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','항암요법종료이유코드','2','항암제 부작용','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','항암요법종료이유코드','3','추적관찰 소실','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','항암요법종료이유코드','4','사망','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','항암요법종료이유코드','9','기타','5','5'),

insert into ph_codebook (id, title, created_by) values ('40560','항암요법치료목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','01','Neoadjuvant','1','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','02','Adjuvant','2','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','03','Palliative','3','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','04','Concurrent','4','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','05','Induction','5','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','99','기타','6','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','07','Maintenance','7','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','08','Salvage','8','9'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','항암요법치료목적코드','09','Consolidation','9','9'),

insert into ph_codebook (id, title, created_by) values ('40570','항암요법평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','01','CR','1','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','02','PR','2','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','03','PD','3','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','04','SD','4','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','05','NE','5','6'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','항암요법평가항목코드','99','기타','6','6'),

insert into ph_codebook (id, title, created_by) values ('40580','혈액제제종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','01','Apheresis platelet','1','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','02','Apheresis platelet 22','2','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','03','Autotransfusion','3','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','04','Cryoprecipitate','4','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','05','Fresh frozen plasma','5','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','06','Platelet','6','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','07','Plateletpheresis (혈액원)','7','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','08','Pre-storage Leukocyte Filtered Red Blood Cells','8','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','09','Red blood cell','9','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','10','Washed red blood cell','10','11'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','혈액제제종류코드','99','기타','11','11'),

insert into ph_codebook (id, title, created_by) values ('50010','재발부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','01','Bone','1','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','02','Brain','2','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','03','Breast(non-OP site)','3','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','04','Breast(OP site)','4','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','05','Distans LN','5','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','06','Liver','6','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','07','LN','7','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','08','Lung','8','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','09','Peritoneum','9','10'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','재발부위코드','99','기타','10','10'),

insert into ph_codebook (id, title, created_by) values ('50020','재발종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','재발종류코드','1','Locoregional','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','재발종류코드','2','Distant(Systemic)','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','재발종류코드','3','Both Local & Distant','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','재발종류코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('50030','재발증상코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','재발증상코드','1','Palpable mass','1','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','재발증상코드','2','Skin change','2','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','재발증상코드','3','PalpableㅣLymph node','3','4'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','재발증상코드','9','기타','4','4'),

insert into ph_codebook (id, title, created_by) values ('50040','재발진단방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','재발진단방법코드','1','영상검사','1','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','재발진단방법코드','2','조직검사','2','3'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','재발진단방법코드','9','기타','3','3'),

insert into ph_codebook (id, title, created_by) values ('50050','재발치료코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','재발치료코드','00000','No','1','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','재발치료코드','10000','Chemotherapy','2','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','재발치료코드','01000','Operation','3','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','재발치료코드','00100','Radiotherapy','4','5'),
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','재발치료코드','00001','Other','5','5'),
