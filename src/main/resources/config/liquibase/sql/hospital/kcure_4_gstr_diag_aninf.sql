insert into ph_item (id, title, activated, category_id, created_by) values (4001, 'hosp_cd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4001, '병원코드');
insert into ph_item_attribute (item_id, data_type) values (4001, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (4002, 'pt_no', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4002, '환자대체번호');

insert into ph_item (id, title, activated, category_id, created_by) values (4003, 'anth_rcrd_ymd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4003, '신체계측기록일자');

insert into ph_item (id, title, activated, category_id, created_by) values (4004, 'anth_rcrd_seq', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4004, '신체계측기록순번');

insert into ph_item (id, title, activated, category_id, created_by) values (4005, 'ht_msrm_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4005, '신장측정값');

insert into ph_item (id, title, activated, category_id, created_by) values (4006, 'wt_msrm_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4006, '체중측정값');

insert into ph_item (id, title, activated, category_id, created_by) values (4007, 'bmi_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4007, 'BMI값');

insert into ph_item (id, title, activated, category_id, created_by) values (4008, 'rlxt_blpr_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4008, '이완혈압값');

insert into ph_item (id, title, activated, category_id, created_by) values (4009, 'ctrt_blpr_vl', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4009, '수축혈압값');

insert into ph_item (id, title, activated, category_id, created_by) values (4010, 'ecog_cd', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4010, 'ECOG코드');
insert into ph_item_attribute (item_id, data_type) values (4010, 'selectbox');

insert into ph_item (id, title, activated, category_id, created_by) values (4011, 'ecog_nm', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4011, 'ECOG명');

insert into ph_item (id, title, activated, category_id, created_by) values (4012, 'crtn_dt', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4012, '생성일시');

insert into ph_item (id, title, activated, category_id, created_by) values (4013, 'ecog_dt', true, 4000, 'system');
insert into ph_item_property (item_id, caption) values (4013, 'UI용 ECOG 참고일자날짜');
