--작업일시: 221115 am10:23

DROP TABLE IF EXISTS GSCN.GSCN_PT_FMHT;
DROP TABLE IF EXISTS GSCN.GSCN_PT_FMHT_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_PT_FMHT (
                              hosp_cd varchar(20) NOT NULL, 							-- 병원코드
                              pt_no varchar(10) NOT NULL, 							-- 환자대체번호
                              fmht_rcrd_ymd timestamp NOT NULL, 						-- 가족력기록일자
                              fmht_rcrd_seq numeric(3) NOT NULL, 						-- 가족력기록순번
                              fmht_yn_noans_spcd varchar(20) NULL, 					-- 가족력여부무응답구분코드
                              fmht_yn_noans_spnm varchar(50) NULL, 					-- 가족력여부무응답구분명
                              pt_fm_rlcd varchar(20) NULL, 							-- 환자가족관계코드
                              pt_fm_rlnm varchar(200) NULL, 							-- 환자가족관계명
                              pt_fmrl_etc_cont varchar(200) NULL, 					-- 환자가족관계기타내용
                              fmhs_htn_yn_noans_spcd varchar(20) NULL, 				-- 가족병력고혈압여부무응답구분코드
                              fmhs_htn_yn_noans_spnm varchar(50) NULL, -- 가족병력고혈압여부무응답구분명
                              fmhs_dbt_yn_noans_spcd varchar(20) NULL, -- 가족병력당뇨여부무응답구분코드
                              fmhs_dbt_yn_noans_spnm varchar(50) NULL, -- 가족병력당뇨여부무응답구분명
                              fmht_tb_yn_noans_spcd varchar(20) NULL, -- 가족력결핵여부무응답구분코드
                              fmht_tb_yn_noans_spnm varchar(50) NULL, -- 가족력결핵여부무응답구분명
                              fmhs_lvds_yn_noans_spcd varchar(20) NULL, -- 가족병력간질환여부무응답구분코드
                              fmhs_lvds_yn_noans_spnm varchar(50) NULL, -- 가족병력간질환여부무응답구분명
                              fmhs_cncr_yn_noans_spcd varchar(20) NULL, -- 가족병력암여부무응답구분코드
                              fmhs_cncr_yn_noans_spnm varchar(50) NULL, -- 가족병력암여부무응답구분명
                              fmht_cncr_kncd varchar(20) NULL, -- 가족력암종류코드
                              fmht_cncr_knnm varchar(200) NULL, -- 가족력암종류명
                              fmht_cncr_kind_etc_cont varchar(200) NULL, -- 가족력암종류기타내용
                              fmhs_etc_yn_noans_spcd varchar(20) NULL, -- 가족병력기타여부무응답구분코드
                              fmhs_etc_yn_noans_spnm varchar(50) NULL, -- 가족병력기타여부무응답구분명
                              fmhs_etc_cont varchar(200) NULL, -- 가족병력기타내용
                              crtn_dt timestamp NOT NULL, -- 생성일시
                              pact_id varchar(50) null, -- UI용 PACT_ID
                              idx varchar(20) NULL, -- UI용 시퀀스
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_pt_fmht_pk PRIMARY KEY (hosp_cd, pt_no, fmht_rcrd_ymd, fmht_rcrd_seq)
);
