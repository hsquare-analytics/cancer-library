--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSTR.GSTR_PT_HLINF;
DROP TABLE IF EXISTS GSTR.GSTR_PT_HLINF_UPDATED;

-- 01.위암_환자_건강정보
CREATE TABLE IF NOT EXISTS GSTR.GSTR_PT_HLINF (
                               idx varchar(20) NOT NULL,
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               adm_ymd varchar(8) NOT NULL, -- 입원일자
                               hlinf_seq numeric(3) NOT NULL, -- 건강정보순번
                               dsch_ymd varchar(8) NULL, -- 퇴원일자
                               cur_drnk_yn_noans_spcd varchar(20) NULL, -- 현재음주여부무응답구분코드
                               cur_drnk_yn_noans_spnm varchar(50) NULL, -- 현재음주여부무응답구분명
                               dhis_yn_noans_spcd varchar(20) NULL, -- 음주력여부무응답구분코드
                               dhis_yn_noans_spnm varchar(50) NULL, -- 음주력여부무응답구분명
                               drnk_strt_age_vl numeric(4) NULL, -- 음주시작연령값
                               drnk_kncd varchar(20) NULL, -- 음주종류코드
                               drnk_knnm varchar(200) NULL, -- 음주종류명
                               drnk_qty varchar(100) NULL, -- 음주량
                               drnk_nt numeric(3) NULL, -- 음주횟수
                               drnk_dtrn_ycnt numeric(3) NULL, -- 음주기간년수
                               nsmk_strt_yr varchar(4) NULL, -- 금주시작년도
                               cur_smok_yn_noans_spcd varchar(20) NULL, -- 현재흡연여부무응답구분코드
                               cur_smok_yn_noans_spnm varchar(50) NULL, -- 현재흡연여부무응답구분명
                               shis_yn_noans_spcd varchar(20) NULL, -- 흡연력여부무응답구분코드
                               shis_yn_noans_spnm varchar(50) NULL, -- 흡연력여부무응답구분명
                               smok_strt_age_vl numeric(4) NULL, -- 흡연시작연령값
                               smok_dtrn_ycnt numeric(3) NULL, -- 흡연기간년수
                               smok_qty numeric(3) NULL, -- 흡연량
                               nsmk_yr varchar(4) NULL, -- 금연시작년도
                               mhis_yn_noans_spcd varchar(20) NULL, -- 병력여부무응답구분코드
                               mhis_yn_noans_spnm varchar(50) NULL, -- 병력여부무응답구분명
                               mhis_hl_yn_noans_spcd varchar(20) NULL, -- 병력고지혈증여부무응답구분코드
                               mhis_hl_yn_noans_spnm varchar(50) NULL, -- 병력고지혈증여부무응답구분명
                               mhis_htn_yn_noans_spcd varchar(20) NULL, -- 병력고혈압여부무응답구분코드
                               mhis_htn_yn_noans_spnm varchar(50) NULL, -- 병력고혈압여부무응답구분명
                               mhis_dbt_yn_noans_spcd varchar(20) NULL, -- 병력당뇨여부무응답구분코드
                               mhis_dbt_yn_noans_spnm varchar(50) NULL, -- 병력당뇨여부무응답구분명
                               mhis_tb_yn_noans_spcd varchar(20) NULL, -- 병력결핵여부무응답구분코드
                               mhis_tb_yn_noans_spnm varchar(50) NULL, -- 병력결핵여부무응답구분명
                               mhis_lvds_yn_noans_spcd varchar(20) NULL, -- 병력간질환여부무응답구분코드
                               mhis_lvds_yn_noans_spnm varchar(50) NULL, -- 병력간질환여부무응답구분명
                               mhis_cncr_yn_noans_spcd varchar(20) NULL, -- 병력암여부무응답구분코드
                               mhis_cncr_yn_noans_spnm varchar(50) NULL, -- 병력암여부무응답구분명
                               mhis_cncr_kncd varchar(20) NULL, -- 병력암종류코드
                               mhis_cncr_knnm varchar(200) NULL, -- 병력암종류명
                               mhis_depr_yn_noans_spcd varchar(20) NULL, -- 병력우울증여부무응답구분코드
                               mhis_depr_yn_noans_spnm varchar(50) NULL, -- 병력우울증여부무응답구분명
                               mhis_insm_yn_noans_spcd varchar(20) NULL, -- 병력불면증여부무응답구분코드
                               mhis_insm_yn_noans_spnm varchar(50) NULL, -- 병력불면증여부무응답구분명
                               mhis_cads_yn_noans_spcd varchar(20) NULL, -- 병력심장질환여부무응답구분코드
                               mhis_cads_yn_noans_spnm varchar(50) NULL, -- 병력심장질환여부무응답구분명
                               etc_mhis_yn_noans_spcd varchar(20) NULL, -- 기타병력여부무응답구분코드
                               etc_mhis_yn_noans_spnm varchar(50) NULL, -- 기타병력여부무응답구분명
                               etc_mhis_diss_cont varchar(200) NULL, -- 기타병력질환내용
                               main_sym_cont varchar(200) NULL, -- 주증상내용
                               main_sym_yn_noans_spcd varchar(20) NULL, -- 주증상여부무응답구분코드
                               main_sym_yn_noans_spnm varchar(50) NULL, -- 주증상여부무응답구분명
                               ohad_hstr_yn_noans_spcd varchar(20) NULL, -- 타병원진단후전원여부무응답구분코드
                               ohad_hstr_yn_noans_spnm varchar(50) NULL, -- 타병원진단후전원여부무응답구분명
                               dsch_stcd varchar(20) NULL, -- 퇴원상태코드
                               dsch_stnm varchar(200) NULL, -- 퇴원상태명
                               crtn_dt timestamp NOT NULL, -- 생성일시
                               pact_id varchar(50) null, -- pact_id ui용
                               REC_WRT_DTM varchar(20) null, -- 작성일자 ui용
                               CONSTRAINT gstr_pt_hlinf_pk PRIMARY KEY (idx)
);

INSERT INTO ph_category (id, title, description, activated, order_no, topic_id, created_by)
VALUES (9100, 'GSTR.GSTR_PT_HLINF', '01.위암_환자_건강정보', true, 1, 999, 'system');

INSERT INTO ph_category_attribute (category_id, date_column, caption)
VALUES (9100, null, '01.위암_환자_건강정보');

insert into ph_item (id, title, category_id, created_by, order_no) values (9101, 'hosp_cd', 9100, 'system', 9101);
insert into ph_item_attribute (item_id, caption, required) values (9101, '병원코드', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9102, 'pt_no', 9100, 'system', 9102);
insert into ph_item_attribute (item_id, caption) values (9102, '환자대체번호');
insert into ph_item_property (item_id, visible) values (9102, false);

insert into ph_item (id, title, category_id, created_by, order_no) values (9103, 'adm_ymd', 9100, 'system', 9103);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9103, '입원일자', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9104, 'hlinf_seq', 9100, 'system', 9104);
insert into ph_item_attribute (item_id, caption, required) values (9104, '건강정보순번', true);

insert into ph_item (id, title, category_id, created_by, order_no) values (9105, 'dsch_ymd', 9100, 'system', 9105);
insert into ph_item_attribute (item_id, caption, format, data_type) values (9105, '퇴원일자', 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9106, 'cur_drnk_yn_noans_spcd', 9100, 'system', 9106, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9106, '현재음주여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9107, 'cur_drnk_yn_noans_spnm', 9100, 'system', 9107);
insert into ph_item_attribute (item_id, caption) values (9107, '현재음주여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9108, 'dhis_yn_noans_spcd', 9100, 'system', 9108, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9108, '음주력여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9109, 'dhis_yn_noans_spnm', 9100, 'system', 9109);
insert into ph_item_attribute (item_id, caption) values (9109, '음주력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9110, 'drnk_strt_age_vl', 9100, 'system', 9110);
insert into ph_item_attribute (item_id, caption) values (9110, '음주시작연령값');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9111, 'drnk_kncd', 9100, 'system', 9111, 10050);
insert into ph_item_attribute (item_id, caption, data_type) values (9111, '음주종류코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9112, 'drnk_knnm', 9100, 'system', 9112);
insert into ph_item_attribute (item_id, caption) values (9112, '음주종류명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9113, 'drnk_qty', 9100, 'system', 9113);
insert into ph_item_attribute (item_id, caption) values (9113, '음주량');

insert into ph_item (id, title, category_id, created_by, order_no) values (9114, 'drnk_nt', 9100, 'system', 9114);
insert into ph_item_attribute (item_id, caption) values (9114, '음주횟수');

insert into ph_item (id, title, category_id, created_by, order_no) values (9115, 'drnk_dtrn_ycnt', 9100, 'system', 9115);
insert into ph_item_attribute (item_id, caption) values (9115, '음주기간년수');

insert into ph_item (id, title, category_id, created_by, order_no) values (9116, 'nsmk_strt_yr', 9100, 'system', 9116);
insert into ph_item_attribute (item_id, caption) values (9116, '금주시작년도');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9117, 'cur_smok_yn_noans_spcd', 9100, 'system', 9117, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9117, '현재흡연여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9118, 'cur_smok_yn_noans_spnm', 9100, 'system', 9118);
insert into ph_item_attribute (item_id, caption) values (9118, '현재흡연여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9119, 'shis_yn_noans_spcd', 9100, 'system', 9119, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9119, '흡연력여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9120, 'shis_yn_noans_spnm', 9100, 'system', 9120);
insert into ph_item_attribute (item_id, caption) values (9120, '흡연력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9121, 'smok_strt_age_vl', 9100, 'system', 9121);
insert into ph_item_attribute (item_id, caption) values (9121, '흡연시작연령값');

insert into ph_item (id, title, category_id, created_by, order_no) values (9122, 'smok_dtrn_ycnt', 9100, 'system', 9122);
insert into ph_item_attribute (item_id, caption) values (9122, '흡연기간년수');

insert into ph_item (id, title, category_id, created_by, order_no) values (9123, 'smok_qty', 9100, 'system', 9123);
insert into ph_item_attribute (item_id, caption) values (9123, '흡연량');

insert into ph_item (id, title, category_id, created_by, order_no) values (9124, 'nsmk_yr', 9100, 'system', 9124);
insert into ph_item_attribute (item_id, caption) values (9124, '금연시작년도');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9125, 'mhis_yn_noans_spcd', 9100, 'system', 9125, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9125, '병력여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9126, 'mhis_yn_noans_spnm', 9100, 'system', 9126);
insert into ph_item_attribute (item_id, caption) values (9126, '병력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9127, 'mhis_hl_yn_noans_spcd', 9100, 'system', 9127, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9127, '병력고지혈증여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9128, 'mhis_hl_yn_noans_spnm', 9100, 'system', 9128);
insert into ph_item_attribute (item_id, caption) values (9128, '병력고지혈증여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9129, 'mhis_htn_yn_noans_spcd', 9100, 'system', 9129, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9129, '병력고혈압여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9130, 'mhis_htn_yn_noans_spnm', 9100, 'system', 9130);
insert into ph_item_attribute (item_id, caption) values (9130, '병력고혈압여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9131, 'mhis_dbt_yn_noans_spcd', 9100, 'system', 9131, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9131, '병력당뇨여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9132, 'mhis_dbt_yn_noans_spnm', 9100, 'system', 9132);
insert into ph_item_attribute (item_id, caption) values (9132, '병력당뇨여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9133, 'mhis_tb_yn_noans_spcd', 9100, 'system', 9133, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9133, '병력결핵여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9134, 'mhis_tb_yn_noans_spnm', 9100, 'system', 9134);
insert into ph_item_attribute (item_id, caption) values (9134, '병력결핵여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9135, 'mhis_lvds_yn_noans_spcd', 9100, 'system', 9135, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9135, '병력간질환여부무응답구분코드', 'selectbox');


insert into ph_item (id, title, category_id, created_by, order_no) values (9136, 'mhis_lvds_yn_noans_spnm', 9100, 'system', 9136);
insert into ph_item_attribute (item_id, caption) values (9136, '병력간질환여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9137, 'mhis_cncr_yn_noans_spcd', 9100, 'system', 9137, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9137, '병력암여부무응답구분코드', 'selectbox');


insert into ph_item (id, title, category_id, created_by, order_no) values (9138, 'mhis_cncr_yn_noans_spnm', 9100, 'system', 9138);
insert into ph_item_attribute (item_id, caption) values (9138, '병력암여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9139, 'mhis_cncr_kncd', 9100, 'system', 9139);
insert into ph_item_attribute (item_id, caption) values (9139, '병력암종류코드');

insert into ph_item (id, title, category_id, created_by, order_no) values (9140, 'mhis_cncr_knnm', 9100, 'system', 9140);
insert into ph_item_attribute (item_id, caption) values (9140, '병력암종류명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9141, 'mhis_depr_yn_noans_spcd', 9100, 'system', 9141, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9141, '병력우울증여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9142, 'mhis_depr_yn_noans_spnm', 9100, 'system', 9142);
insert into ph_item_attribute (item_id, caption) values (9142, '병력우울증여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9143, 'mhis_insm_yn_noans_spcd', 9100, 'system', 9143, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9143, '병력불면증여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9144, 'mhis_insm_yn_noans_spnm', 9100, 'system', 9144);
insert into ph_item_attribute (item_id, caption) values (9144, '병력불면증여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9145, 'mhis_cads_yn_noans_spcd', 9100, 'system', 9145, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9145, '병력심장질환여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9146, 'mhis_cads_yn_noans_spnm', 9100, 'system', 9146);
insert into ph_item_attribute (item_id, caption) values (9146, '병력심장질환여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9147, 'etc_mhis_yn_noans_spcd', 9100, 'system', 9147, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9147, '기타병력여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9148, 'etc_mhis_yn_noans_spnm', 9100, 'system', 9148);
insert into ph_item_attribute (item_id, caption) values (9148, '기타병력여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9149, 'etc_mhis_diss_cont', 9100, 'system', 9149);
insert into ph_item_attribute (item_id, caption) values (9149, '기타병력질환내용');

insert into ph_item (id, title, category_id, created_by, order_no) values (9150, 'main_sym_cont', 9100, 'system', 9150);
insert into ph_item_attribute (item_id, caption) values (9150, '주증상내용');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9151, 'main_sym_yn_noans_spcd', 9100, 'system', 9151, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9151, '주증상여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9152, 'main_sym_yn_noans_spnm', 9100, 'system', 9152);
insert into ph_item_attribute (item_id, caption) values (9152, '주증상여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9153, 'ohad_hstr_yn_noans_spcd', 9100, 'system', 9153, 10040);
insert into ph_item_attribute (item_id, caption, data_type) values (9153, '타병원진단후전원여부무응답구분코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9154, 'ohad_hstr_yn_noans_spnm', 9100, 'system', 9154);
insert into ph_item_attribute (item_id, caption) values (9154, '타병원진단후전원여부무응답구분명');

insert into ph_item (id, title, category_id, created_by, order_no, codebook_id) values (9155, 'dsch_stcd', 9100, 'system', 9155, 10060);
insert into ph_item_attribute (item_id, caption, data_type) values (9155, '퇴원상태코드', 'selectbox');

insert into ph_item (id, title, category_id, created_by, order_no) values (9156, 'dsch_stnm', 9100, 'system', 9156);
insert into ph_item_attribute (item_id, caption) values (9156, '퇴원상태명');

insert into ph_item (id, title, category_id, created_by, order_no) values (9157, 'crtn_dt', 9100, 'system', 9157);
insert into ph_item_attribute (item_id, caption, required, format, data_type) values (9157, '생성일시', true, 'yyyy-MM-dd', 'date');

insert into ph_item (id, title, category_id, created_by, order_no) values (9158, 'pact_id', 9100, 'system', 9158);
insert into ph_item_attribute (item_id, caption) values (9158, 'pact_id(ui용)');

insert into ph_item (id, title, category_id, created_by, order_no) values (9159, 'rec_wrt_dtm', 9100, 'system', 9159);
insert into ph_item_attribute (item_id, caption) values (9159, '작성일자(ui용)');

-- insert into ph_item (id, title, category_id, created_by, order_no) values (9160, 'idx', 9100, 'system', 9160);
-- insert into ph_item_attribute (item_id, caption) values (9160, 'ui용 시퀀스');
