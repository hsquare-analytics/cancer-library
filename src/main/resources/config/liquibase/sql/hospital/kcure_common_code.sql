insert into ph_codebook (id, title, created_by) values ('10020','결혼상세코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','1','미혼','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','2','기혼','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','3','이혼','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','4','사별','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10020','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('10030','암종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','01','뇌','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','02','위','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','03','폐','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','04','간','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','05','대장','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','06','유방','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','07','자궁','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','08','전립선','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','09','갑상선','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','10','난소','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','11','췌장','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','12','담도','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','13','혈액','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','14','골육종','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','15','구강','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','16','신장','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10030','99','기타','17');

insert into ph_codebook (id, title, created_by) values ('10040','여부무응답구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','Y','예','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','N','아니오','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10040','Z','무응답','3');

insert into ph_codebook (id, title, created_by) values ('10050','음주종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','01','맥주','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','02','소주','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','03','양주','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','04','막걸리','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','08','무응답','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10050','09','기타','6');

insert into ph_codebook (id, title, created_by) values ('10060','퇴원상태코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','01','호전','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','02','악화','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','03','호전안됨','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','04','진단뿐','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','05','가망없는퇴원','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','06','사망','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10060','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('10070','환자가족관계코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','01','아버지','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','02','어머니','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','03','자녀','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','04','형제자매','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','05','친척','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','98','무응답','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('10070','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('20010','ECOG코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','01','제한없이 정상적이다','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','02','증상이 있으나 스스로 활동 가능하다','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','03','증상이 있으나 누워 지내는 시간은 하루의 반보다 적다','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','04','증상이 있으며 누워 지내는 시간이 하루의 절반이상이다','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','05','계속 누워 있어야 한다','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20010','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('20030','수술후합병증분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20030','1','Local complication','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20030','2','Systemic complication','2');

insert into ph_codebook (id, title, created_by) values ('20040','수술후합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','01','Intra-abdominal fluid collection','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','02','Intra-abdominal bleeding','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','03','Intraluminal bleeding','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','04','Intestinal obstruction (=ileus)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','05','Anastomotic leakage','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','06',' Chylous ascites','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','07','Duodenal stump leakage','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','08','Anastomotic stricture','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','09','pancreatic leakage','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','10','Delayed gastric emptying (= gastric stasis)','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','11','Wound complication','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','12','Respiratory complications','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','13','Cardiovascular complications','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','14','Central nervous system complications','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','15','Urinary system complications','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','16','Hepatic system complications','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','17','Endocrine system complications','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20040','99','기타','18');

insert into ph_codebook (id, title, created_by) values ('20050','임상종양특성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','1','Primary','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','2','Remnant','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','3','Meta','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20050','9','기타  ','4');

insert into ph_codebook (id, title, created_by) values ('20060','전이부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','01','Breast(OP site)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','02','Breast(non-OP site)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','03','LN','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','04','Lung','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','05','Liver','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','06','Brain','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','07','Bone','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','08','Ovary','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','09','Peritoneum','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20060','99','기타','10');

insert into ph_codebook (id, title, created_by) values ('20070','전이양상코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','1','single lesion','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','2','multiple lesion - synchronous','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','3','multiple lesion - metachronous','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20070','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('20080','전이진단방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','1','영상검사','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','2','조직검사','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20080','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('20090','전이치료코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','00000','No','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','10000','Chemotherapy','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','01000','Operation','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','00100','Radiotherapy','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20090','00001','Other','5');

insert into ph_codebook (id, title, created_by) values ('20100','진단종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','01','위암(C16)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','02','대장암(C18)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','03','간암(C22)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','04','담도암(C24)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','05','췌장암(C25)','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','06','폐암(C34)','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','07','유방암(C50)','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','08','난소암(C56)','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','09','전립선(C61)','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','10','신장암(C64)','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','11','갑상선암(C73)','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','98','기타암(모집단 이외 C Code)','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20100','99','기타질환','13');

insert into ph_codebook (id, title, created_by) values ('20120','합병증등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','01','Grade 1','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','02','Grade 2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','03','Grade 3','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','04','Grade 3a','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','05','Grade 3b','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','06','Grade 5','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','07','Grade 4','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','08','Grade 4a','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('20120','09','Grade 4b','9');

insert into ph_codebook (id, title, created_by) values ('30010','DNA변이정보B코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','1','A>','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','2','G>','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','3','T>','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30010','4','C>','4');

insert into ph_codebook (id, title, created_by) values ('30020','DNA변이정보C코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','01','A','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','02','G','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','03','C','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','04','T','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','05','ins','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','06','del','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','07','dup','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30020','08','Unknown','8');

insert into ph_codebook (id, title, created_by) values ('30030','EUS_M병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','1','MX','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','2','M0','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30030','3','M1','3');


insert into ph_codebook (id, title, created_by) values ('30040','EUS_N병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','1','NX','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','2','N0','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30040','3','N(+)','3');

insert into ph_codebook (id, title, created_by) values ('30050','EUS_T병기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','01','TX','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','02','T1a','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','03','T1b','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','04','T2','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','05','T3','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','06','T4a','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30050','07','T4b','7');

insert into ph_codebook (id, title, created_by) values ('30060','EUS합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','1','None','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','2','bleeding','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','3','perforation','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','4','Mallory-weiss tearing','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30060','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30070','GROSS유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','01','EGC-I','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','02','EGC-IIa','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','03','EGC-IIb','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','04','EGC-IIc','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','05','EGC-III','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','06','AGC-Bormann type 4','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','07','AGC-Bormann type 1','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','08','AGC-Bormann type 2','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','09','AGC-Bormann type 3','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','10','AGC-Bormann type 5','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','11','Combination','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30070','99','기타/Unclassifiable','12');

insert into ph_codebook (id, title, created_by) values ('30080','HPYLORI검사결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','1','Negative','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','2','Positive','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30080','3','not evaluable','3');

insert into ph_codebook (id, title, created_by) values ('30090','HPYLORI검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','1','Rapid urease test(CLO test)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','2','Urea Breath Test','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','3','Histology(병리검사)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','4','H.pylori IgG Ab','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30090','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30120','감지여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','Y','Detected','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','N','Not detected','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30120','Z','Unknown','3');

insert into ph_codebook (id, title, created_by) values ('30130','동반병변코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','01','Microcalcification','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','02','Foreign body reaction','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','03','Usual ductal hyperplasia','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','04','Stromal degeneration','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','05','Sclerosing adenosis','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','06','Mucinous component','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','07','Intraductal papilloma','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','08','Stromal fibrosis','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','09','Apocrine differentiation','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','10','Apocrine metaplasia','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','11','Foamy histiocytic collection','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','12','Fibroadenoma','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','13','Complex sclerosing lesion','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','14','Medullary feature','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30130','99','기타','15');

insert into ph_codebook (id, title, created_by) values ('30140','면역병리검사결과단위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30140','1','Score','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30140','2','%','2');

insert into ph_codebook (id, title, created_by) values ('30150','면역병리검사소견분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','01','Positive','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','02','Negative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','03','Equivocal','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','04','Not evaluable ','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','05','Needle biopsy','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','06','Endoscopic biopsy','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','07','Excision','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30150','99','기타','8');

insert into ph_codebook (id, title, created_by) values ('30160','면역병리검사소견코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','01','Positive','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','02','Negative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','03',' Focal positive','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','04','Equivocal','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','05','Not evaluable','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30160','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('30170','면역병리검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','01','hMLH1','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','02','hMSH2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','03','MSH6','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','04','PMS2','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','05','HER2(=C-erbB2)','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','06','p53','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','07','EGFR','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','08','PD-L1','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','09','EBV','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','10','ER','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','11','PR','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','12','HER2','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','13','Ki67','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','14','CK5/6','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','15','AR','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','16','TIL','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30170','99','기타','17');

insert into ph_codebook (id, title, created_by) values ('30190','분자병리검사결과종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','1','검사한 종양 세포의 핵 개수','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','2','핵당 HER2 평균수','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','3','핵당 CEP17 평균수','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','4','HER2/CEP17 비율','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30190','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30200','분자병리검사결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','1','Positive','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','2','Negative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','3','Equivocal','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30200','4','Not evaluable ','4');

insert into ph_codebook (id, title, created_by) values ('30210','분자병리검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30210','1','SISH','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30210','2','FISH','2');

insert into ph_codebook (id, title, created_by) values ('30220','분자병리검사소견코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','1','Positive','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','2','Negative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','3','Equivocal','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30220','4','Not evaluable','4');

insert into ph_codebook (id, title, created_by) values ('30230','분자병리검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','1','Microsatellite instability(MSI)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','2','HER-2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','3','EBV ISH','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30230','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('30250','상피내암핵등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','01','Gx','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','02','G1','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','03','G2','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','04','G3','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','05','low','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','06','intermediate','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','07','high','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30250','99','기타','8');

insert into ph_codebook (id, title, created_by) values ('30260','생식세포변이검사방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','1','Sanger sequencing','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','2','NGS','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30260','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('30270','생식세포변이검사유전자종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','1','BRCA1','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','2','BRCA2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30270','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('30290','생체검사방법종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','01','Biopsy','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','02','Computed tomography and biopsy','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','03','Laparoscopic biopsy','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','04','Needle biopsy','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','05','Endoscopic biopsy','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','06','Excision','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','07','Percutaneous liver biopsy','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','08','Surgical biopsy','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','09','Transjugular biopsy','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','10','Transjugular biopsy using fluoroscopic guidance','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','11','Ultrasound scan and biopsy','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','12','Wedge biopsy','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','13','Vacuum Assisted Breast Biopsy(MMT)','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','14','Gun biopsy','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30290','99','기타','15');

insert into ph_codebook (id, title, created_by) values ('30310','생체검사부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','01','Breast','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','02','LN','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','03','Chest','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','04','Stomach','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','05','Liver','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','06','Lung','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','07','Brain','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30310','99','기타','8');

insert into ph_codebook (id, title, created_by) values ('30320','생체검사부위편측성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','1','Left','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','2','Right','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','3','Bilateral','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30320','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('30330','수술절제면잔존코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','1','R0','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','2','R1','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','3','R2','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30330','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('30340','수술후둘레방향종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','01','Lesser curvature','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','02','Greater curvature','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','03','Anterior wall','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','04','Posterior wall','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','05','Encircling','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','06','Cardia','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','07','Fundus','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','08','Body','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','09','Angle','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','10','Antrum','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','11','Pylorus','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','12','Esophagus','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','13','Upper (EGJ 포함)','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','14','Middle','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','15','Lower','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','16','Duodenum','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','17','Entire (Whole)','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30340','99','기타','18');

insert into ph_codebook (id, title, created_by) values ('30350','아미노산변이정보A코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','01','Ala(A)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','02','Arg(R)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','03','Asn(N)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','04','Asp(D)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','05','Cys(C)','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','06','His(H)','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','07','Gly(G)','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','08','Glu(E)','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','09','Gln(Q)','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','10','Ile(I)','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','11','Leu(L)','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','12','Lys(K)','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','13','Met(M)','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','14','Ser(S)','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','15','Thr(T)','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','16','Trp(W)','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','17','Tyr(Y)','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','18','Phe(F)','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','19','Pro(P)','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','20','Val(V)','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30350','99','기타','21');

insert into ph_codebook (id, title, created_by) values ('30360','아미노산변이정보C코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','01','Ala(A)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','02','Arg(R)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','03','Asn(N)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','04','Asp(D)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','05','Cys(C)','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','06','His(H)','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','07','Gly(G)','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','08','Glu(E)','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','09','Gln(Q)','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','10','Ile(I)','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','11','Leu(L)','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','12','Lys(K)','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','13','Met(M)','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','14','Ser(S)','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','15','Thr(T)','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','16','Trp(W)','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','17','Tyr(Y)','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','18','Phe(F)','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','19','Pro(P)','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','20','Val(V)','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','21','fs(Frame shift)','21');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','22','dup','22');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','23','del','23');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','24','ins','24');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','25','*(Ter/Stop)','25');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30360','99','기타','26');

insert into ph_codebook (id, title, created_by) values ('30370','양성여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','Y','Positive','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','N','Negative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30370','Z','Indeterminate','3');

insert into ph_codebook (id, title, created_by) values ('30380','여부확인불가구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','Y','Yes','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','N','No','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30380','Z','Unknown','3');

insert into ph_codebook (id, title, created_by) values ('30400','영상검사결과진단적분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','01','negative','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','02','benign','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','03','probably benign','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','04','suspicous','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','05','highly suggestive','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','06','proven malignancy','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30400','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('30410','영상검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','01','MMG','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','02','DBT','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','03','SONO','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','04','PET','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','05','MRI','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','06','CT','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','07','Dexa','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','08','X-ray','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','09','Bone scan','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30410','99','기타','10');

insert into ph_codebook (id, title, created_by) values ('30430','외과병리채취부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','1','Breast','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','2','Stomach','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','3','LN','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30430','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('30440','위내시경검사결과유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','01','EGC-I','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','02','EGC-IIa','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','03','EGC-IIb','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','04','EGC-IIc','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','05','EGC-III','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','06','AGC-Bormann type 4','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','07','AGC-Bormann type 1','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','08','AGC-Bormann type 2','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','09','AGC-Bormann type 3','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','10','AGC-Bormann type 5','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','11','Combination','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30440','99','기타/Unclassifiable','12');

insert into ph_codebook (id, title, created_by) values ('30450','위내시경검사목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','01','진단','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','02','내시경 시술 및 추적검사','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','03','수술후 추적검사','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','04','공단검진','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','05','암예방검진센터 수검자','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30450','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('30460','위내시경합병증등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','01','0','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','02','I','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','03','II','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','04','IIIa','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','05','IV','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','06','V','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30460','07','Not available','7');

insert into ph_codebook (id, title, created_by) values ('30470','위내시경합병증코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','1','None','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','2','bleeding','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','3','perforation','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','4','Mallory-weiss tearing','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30470','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30480','위식도경계부위암분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','1','Type I','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','2','Type II','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','3','Type III','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30480','4','해당없음','4');

insert into ph_codebook (id, title, created_by) values ('30490','유방밀도분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','1','fatty breast','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','2','scattered fibroglandular','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','3','heterogeneously dense','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','4','extremely dense ','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30490','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30500','유전자발현검사결과종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','01','EPclin score','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','02','Risk Assessment','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','03','Mammaprint Index','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','04','Risk-of-Recurrence Result','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30500','05','Oncotype Recurrence Score (RS)','5');

insert into ph_codebook (id, title, created_by) values ('30510','유전자발현검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','01','Oncotype Dx','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','02','Mammaprint','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','03','Endopredict','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','04','BCI','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','05','GenesWell BCT','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','06','Oncofree','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30510','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('30520','조직학적등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','1','Gx','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','2','G1','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','3','G2','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30520','4','G3 ','4');

insert into ph_codebook (id, title, created_by) values ('30530','조직학적분화도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','1','Well differentiated','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','2','Moderately differentiated','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','3','Poorly differentiated','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','4','Combined','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30530','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('30540','조직학적진단코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','01','Adenosquamous carcinoma','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','02','Carcinoma with lymphoid stroma','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','03','DCIS ; Ductal carcinoma in situ','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','04','Gastrointestinal stromal tumor','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','05','Hepatoid adenocarcinoma','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','06','ILC ;Invasive lobular carcinoma','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','07','Invasive ductal carcinoma ;IDC, micro IDC','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','08','LCIS ; Lobular carcinoma in situ','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','09','Lymphoma','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','10','Malignant Phyllodes tumor','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','11','Medullary carcinoma','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','12','Metaplastic carcinoma','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','13','Mixed adenocarcinoma','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','14','Mucinous adenocarcinoma','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','15','Mucinous carcinoma','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','16','Neuroendocrine tumor','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','17','Paget''s disease','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','18','Papillary adenocarcinoma','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','19','Papillary carcinoma','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','20','Poorly cohesive carcinoma(signet ring cell carcinoma 포함)','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','21','Sarcoma','21');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','22','Squamous cell carcinoma','22');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','23','Tubular adenocarcinoma','23');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','24','Tubular carcinoma','24');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','25','Undifferentiated carcinoma','25');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30540','99','기타','26');

insert into ph_codebook (id, title, created_by) values ('30550','존재여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','Y','Present','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','N','Absent','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30550','Z','Not evaluable','3');

insert into ph_codebook (id, title, created_by) values ('30560','종양코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','01','No residual','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','02','CIS only','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','03','Residual breast tumor','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','04','Residual LN meta','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','05','Residual breast tumor and LN meta','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30560','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('30580','진단검사종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','01','Albumin','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','02','Alkaline Phosphatase','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','03','ALT ','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','04','ANC','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','05','Basophil','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','06','CA 15-3','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','07','CA-125','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','08','CA19-9','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','09','CA72-4','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','10','Calcium','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','11','CEA','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','12','Creatinine','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','13','CRP','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','14','E2','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','15','Eosinophil','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','16','Ferritin','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','17','FSH','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','18','Glucose','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','19','Hb','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','20','Hematocrit','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','21','Hemoglobin','21');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','22','Iron','22');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','23','Lymphocyte','23');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','24','Monocyte','24');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','25','Neutrophil','25');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','26','Platelets','26');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','27','Protein','27');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','28','RBC ','28');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','29','TIBC','29');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','30','Total Cholesterol','30');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','31','Vitamin B12','31');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','32','WBC','32');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30580','99','기타','33');

insert into ph_codebook (id, title, created_by) values ('30600','침습장기코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','01','Colon','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','02','Spleen','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','03','Pancreas','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','04','Liver','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','05','Mesocolon','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','06','Adrenal gland','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','07','Diaphragm','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','08','Abdominal wall','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','09','Gallbladder','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','10','Retroperitoneum','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30600','99','기타','11');

insert into ph_codebook (id, title, created_by) values ('30610','침윤정도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','01','Mucosa','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','02','Submucosa','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','03','Proper muscle','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','04','Subseroca','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','05','Serosa','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','06','Adjacent organ','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30610','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('30620','편측성코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','1','Left','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','2','Right','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','3','Bilateral','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30620','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('30630','포함여부구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','Y','Involved','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','N','Not involved','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('30630','Z','No data','3');

insert into ph_codebook (id, title, created_by) values ('40010','ASA점수코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','01','정상의 건강한 환자','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','02','경도의 전신 질환을 가진 환자','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','03','중등도의 중증 전신질환을 가진 환자','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','04','지속적으로 생명을 위협하는 중증의 전신질환을 가진 환자','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','05','수술하지 않으면 생명을 유지할 수 없는 정도의 중증질환을 가진 환자','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40010','99','장기 공여를 위한 수술 예정인 뇌사자','6');

insert into ph_codebook (id, title, created_by) values ('40020','ESD결과코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','1','En bloc resection','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','2','Piecemeal resection','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40020','3','Failure','3');

insert into ph_codebook (id, title, created_by) values ('40030','ESD병변모양코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','1','Elevated (I, IIa, IIa+IIc)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','2','flat (IIb)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40030','3','depressed  (IIc)','3');

insert into ph_codebook (id, title, created_by) values ('40040','ESD병변위치가로코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','1','Lessor curvature','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','2','Greater curvature','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','3','Posterior wall','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40040','4','Anterior wall','4');

insert into ph_codebook (id, title, created_by) values ('40050','ESD병변위치세로코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','01','Antrum','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','02','Angle','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','03','Lowerbody','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','04','Midbody','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40050','05','Upperbody or cardia','5');

insert into ph_codebook (id, title, created_by) values ('40060','ESD천공조치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','1','수술','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','2','내시경적치료 (clipping)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40060','3','내시경치료 없이 보존치료 (산소투여 등)','3');

insert into ph_codebook (id, title, created_by) values ('40080','감시림프절검출방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','1','Radioisotope','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','2','ICG','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','3','Indigocarmine','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','4','Dye','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40080','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('40090','그물막절제범위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','1','Total','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','2','Partial','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','3','Not done','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40090','4','Not applicable','4');

insert into ph_codebook (id, title, created_by) values ('40100','근치도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','1','R0 resection','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','2','R1 resection','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','3','R2 resection','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40100','4','Not applicable','4');

insert into ph_codebook (id, title, created_by) values ('40110','림프절절제정도코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','01','<D1','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','02','D1','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','03','D1+','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','04','D2','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','05','D2+','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','06','Sentinel basin dissection','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','07','none','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40110','99','기타','8');

insert into ph_codebook (id, title, created_by) values ('40130','방사선치료목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','1','Curative','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','2','Palliative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','3','Adjuvant','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','4','Neoadjuvant','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40130','9','Other','5');

insert into ph_codebook (id, title, created_by) values ('40140','방사선치료부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','01','Breast','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','02','LN','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','03','Stomach','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','04','Distant lymph node','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','05','Bone','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','06','Brain','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','07','abdomen wall','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','08','Lung','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','09','Liver','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','10','Boost','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40140','99','기타','11');

insert into ph_codebook (id, title, created_by) values ('40150','방사선치료부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','01','Grade 1','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','02','Grade 2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','03','Grade 3','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','04','Grade 4','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40150','05','Grade 5','5');

insert into ph_codebook (id, title, created_by) values ('40160','방사선치료부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40160','1','급성(3개월 이내)','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40160','2','만성(3개월 초과)','2');

insert into ph_codebook (id, title, created_by) values ('40170','방사선치료부작용종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','01','Skin irritation','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','02','Aches','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','03','Fatigue','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','04','Heart damage','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','05','Radiation pneumonitis','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40170','06','Swelling of  breast','6');

insert into ph_codebook (id, title, created_by) values ('40180','방사선치료종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','01','체외조사','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','02','체부 정위적 방사선수술','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','03','정위적 방사선 분할치료','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','04','전신조사','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','05','입체조형치료','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','06','뇌 정위적 방사선수술','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','07','양성자 치료','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','08','세기변조 방사선치료','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','09','밀봉소선원치료','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40180','99','기타','10');

insert into ph_codebook (id, title, created_by) values ('40200','방사선치료평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','01','CR','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','02','PR','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','03','PD','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','04','SD','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','05','NE','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40200','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40230','수술둘레방향종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','01','Lesser curvature','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','02','Greater curvature','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','03','Anterior wall','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','04','Posterior wall','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','05','Encircling','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','06','Cardia','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','07','Fundus','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','08','Body','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','09','Angle','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','10','Antrum','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','11','Pylorus','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','12','Esophagus','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','13','Upper (EGJ 포함)','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','14','Middle','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','15','Lower','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','16','Duodenum','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','17','Entire (Whole)','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40230','99','기타','18');

insert into ph_codebook (id, title, created_by) values ('40240','수술마취부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','01','전신','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','02','척추','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','03','경막외','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','04','척추+경막외','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','05','신경차단','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','06','정맥','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','07','MAC','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','08','국소','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40240','99','기타','9');

insert into ph_codebook (id, title, created_by) values ('40250','수술목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','1','Curative','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','2','Palliative','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40250','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('40260','수술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','01','내시경 복강경 협력 수술','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','02','복강경보조','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','03','전복강경 (다공, multi-port)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','04','전복강경 (단일공, single port)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','05','개복','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','06','로봇-다공','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','07','로봇-단일공','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','08','로봇 보조','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40260','99','기타','9');

insert into ph_codebook (id, title, created_by) values ('40270','수술부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','1','Breast','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','2','LN','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40270','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('40280','수술시항암요법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','01','No','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','02','IP chemo','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','03','HIPEC','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','04','LHIPEC','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','05','PIPAC','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40280','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40290','수술절개방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','01','Upper midline','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','02','Rt upper transverse incision & multi-ports','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','03','Short upper midline & multi-ports','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','04','Umbilical incision & multi-ports','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','05','Single port/ single incision','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40290','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40300','수술절개선유형코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','01','Periareolar','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','02','Radial','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','03','Curved linear','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','04','Elliptical','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','05','Inframammary','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40300','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40310','수술종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','01','Total gastrectomy','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','02','Distal gastrectomy','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','03','Proximal gastrectomy','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','04','Pylorus preserving gastrectomy','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','05','Segmental resection','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','06','Wedge resection','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','07','Open and closure with biopsy','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','08','Partial Mastectomy','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','09','Breast conserving surgery','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','10','Local excision of lesion of breast','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','11','Mastectomy With Axillary L/N Dissection','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','12','Mastectomy Without Axillary L/N Dissection','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','13','Lumpectomy','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','14','Resection of quadrant of breast','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','15','Simple Mastectomy','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','16','Subcutaneous Mastectomy','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','17','Modified radical mastectomy','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','18','Skin sparing mastectomy','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','19','Axillary Sentinel Lymph Node Excision','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','20','Dissection of  Axillary Lymph Node','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','21','Excision or destruction of breast tissue','21');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','22','Reduction Mammoplasty','22');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','23','Other Mammoplasty','23');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','24','Augmentation Mammoplasty','24');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','25','Immediate Implant Insertion Following Mastectomy','25');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','26','Breast Reconstruction','26');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','27','Revision of implant of breast','27');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','28','Musculocutaneous Flap','28');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40310','99','기타','29');

insert into ph_codebook (id, title, created_by) values ('40320','수술종양상세위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','01','Upper outer','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','02','Upper inner','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','03','Lower outer','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','04','Lower inner','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','05','Central','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40320','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40330','수술종양위치코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','1','Left','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','2','Right','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','3','Bilateral','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40330','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('40350','수술후평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','01','CR','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','02','PR','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','03','PD','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','04','SD','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','05','NE','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40350','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40380','약제구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','01','세포독성약제','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','02','항암표적약제','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','03','항암내분비약제','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','04','항암면역약제','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','05','기타항암약제','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40380','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40390','약제분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40390','1','항암약제','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40390','9','기타약제','2');

insert into ph_codebook (id, title, created_by) values ('40400','약제성분종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','01','capecitabine','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','02','cisplatin','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','03','docetaxel','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','04','doxorubicin','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','05','epirubicin','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','06','etoposide','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','07','fluorouracil','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','08','Tegafur/gimeracil/oteracil(S-1)','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','09','irinotecan hydrochloride','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','10','oxaliplatin','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','11','paclitaxel','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','12','carboplatin','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','13','methotrexate','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','14','mitomycin C','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','15','Trifluridine-tipiracil','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','16','ramucirumab','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','17','trastuzumab','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','18','nivolumab','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','19','pembrolizumab','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','20','leucovorin','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40400','99','기타','21');

insert into ph_codebook (id, title, created_by) values ('40420','약제처방용량단위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','01','mg/kg','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','02','mg/m2','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','03','tab','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','04','AMP','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','05','g','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','06','mcg/kg','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','07','g/kg','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','08','g/m2','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','09','mcg','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','10','mcg/m2','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','11','mg','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','12','cap','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','13','dos','13');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','14','ea','14');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','15','g','15');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','16','ke','16');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','17','kit','17');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','18','mcg','18');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','19','mg','19');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','20','ml','20');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','21','pfu','21');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','22','pkg','22');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','23','set','23');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','24','unit','24');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40420','99','기타','25');

insert into ph_codebook (id, title, created_by) values ('40440','약제투여경로코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','01','경구','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','02','정맥내주사','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','03','근육주사','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','04','피하주사','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','05','피내주사','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','06','척수강내주사','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40440','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('40450','유방암수술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','1','Opne','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','2','Endoscopic','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','3','Robotic','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40450','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('40460','재건술방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','01','Stapler','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','02','Hand-sewing','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','03','Not applicable','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','04','TRAM/DIEP','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','05','Tissue expander','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','06','Direct to implant','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','07','LD flap','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','08','Vicryl mesh','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','09','Advanced glandular','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40460','99','기타','10');

insert into ph_codebook (id, title, created_by) values ('40470','재건술분류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','1','Immediate reconstruction','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','2','Delayed reconstruction','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','3','Oncoplastic','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','4','Not applicable','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40470','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('40480','재건술접근법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','1','Intracorporeal','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','2','Extracorporeal','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','3','Not applicable','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40480','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('40490','재건술종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','01','Billroth I','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','02','Billroth II','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','03','Roux-en-Y','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','04','Gastrogastrostomy','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','05','Esophagogastrostomy','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','06','Double tract method','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','07','Primary repair','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40490','99','기타','8');

insert into ph_codebook (id, title, created_by) values ('40500','합병절제부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','01','None','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','02','Gall Baldder','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','03','Spleen','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','04','Pancreas','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','05','Colon','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','06','Liver','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40500','99','기타','7');

insert into ph_codebook (id, title, created_by) values ('40510','항암약제구분코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','1','세포독성약제','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','2','항암표적약제','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','3','항암내분비약제','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','4','항암면역약제','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40510','9','기타항암약제','5');

insert into ph_codebook (id, title, created_by) values ('40520','항암요법부작용등급코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','01','I','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','02','II','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','03','III','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','04','IV','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40520','05','V','5');

insert into ph_codebook (id, title, created_by) values ('40530','항암요법부작용코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','01','Anorexia','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','02','Hand-foot syndrome','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','03','Nausea/vomiting','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','04','Alopecia','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','05','Dry skin','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40530','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40540','항암요법부작용항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','01','Anorexia','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','02','Hand-foot syndrome','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','03','Nausea/vomiting','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','04','Alopecia','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','05','Dry skin','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','06','Diarrhea','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','07','Leukopenia','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','08','Fatigue','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','09','Constipation','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','10','Skin rash','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','11','Mucositis','11');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','12','Neuropathy','12');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40540','99','기타','13');

insert into ph_codebook (id, title, created_by) values ('40550','항암요법종료이유코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','1','Tumor progression','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','2','항암제 부작용','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','3','추적관찰 소실','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','4','사망','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40550','9','기타','5');

insert into ph_codebook (id, title, created_by) values ('40560','항암요법치료목적코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','01','Neoadjuvant','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','02','Adjuvant','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','03','Palliative','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','04','Concurrent','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','05','Induction','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','99','기타','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','07','Maintenance','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','08','Salvage','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40560','09','Consolidation','9');

insert into ph_codebook (id, title, created_by) values ('40570','항암요법평가항목코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','01','CR','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','02','PR','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','03','PD','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','04','SD','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','05','NE','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40570','99','기타','6');

insert into ph_codebook (id, title, created_by) values ('40580','혈액제제종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','01','Apheresis platelet','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','02','Apheresis platelet 22','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','03','Autotransfusion','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','04','Cryoprecipitate','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','05','Fresh frozen plasma','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','06','Platelet','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','07','Plateletpheresis (혈액원)','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','08','Pre-storage Leukocyte Filtered Red Blood Cells','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','09','Red blood cell','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','10','Washed red blood cell','10');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('40580','99','기타','11');

insert into ph_codebook (id, title, created_by) values ('50010','재발부위코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','01','Bone','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','02','Brain','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','03','Breast(non-OP site)','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','04','Breast(OP site)','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','05','Distans LN','5');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','06','Liver','6');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','07','LN','7');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','08','Lung','8');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','09','Peritoneum','9');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50010','99','기타','10');

insert into ph_codebook (id, title, created_by) values ('50020','재발종류코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','1','Locoregional','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','2','Distant(Systemic)','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','3','Both Local & Distant','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50020','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('50030','재발증상코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','1','Palpable mass','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','2','Skin change','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','3','PalpableㅣLymph node','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50030','9','기타','4');

insert into ph_codebook (id, title, created_by) values ('50040','재발진단방법코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','1','영상검사','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','2','조직검사','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50040','9','기타','3');

insert into ph_codebook (id, title, created_by) values ('50050','재발치료코드','system');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','00000','No','1');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','10000','Chemotherapy','2');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','01000','Operation','3');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','00100','Radiotherapy','4');
insert into ph_codebook_lookup (codebook_id, description, title, order_no) values ('50050','00001','Other','5');
