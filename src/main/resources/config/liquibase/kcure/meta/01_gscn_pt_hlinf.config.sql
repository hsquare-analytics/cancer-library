--작업일시: 221115 am10:02

DROP TABLE IF EXISTS GSCN.GSCN_PT_HLINF;
DROP TABLE IF EXISTS GSCN.GSCN_PT_HLINF_UPDATED;

-- 01.위암_환자_건강정보
CREATE TABLE IF NOT EXISTS GSCN.GSCN_PT_HLINF (
                               idx varchar(20) NOT NULL,
                               hosp_cd varchar(20) NOT NULL, -- 병원코드
                               pt_no varchar(10) NOT NULL, -- 환자대체번호
                               adm_ymd timestamp NOT NULL, -- 입원일자
                               hlinf_seq numeric(3) NOT NULL, -- 건강정보순번
                               dsch_ymd timestamp NULL, -- 퇴원일자
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
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_pt_hlinf_pk PRIMARY KEY (idx)
);
