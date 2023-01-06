--작업일시: 221115 am10:32

DROP TABLE IF EXISTS GSCN.GSCN_DIAG_ANINF;
DROP TABLE IF EXISTS GSCN.GSCN_DIAG_ANINF_UPDATED;

CREATE TABLE IF NOT EXISTS GSCN.GSCN_DIAG_ANINF (
                                 hosp_cd varchar(20) NOT NULL, 					-- 병원코드
                                 pt_no varchar(10) NOT NULL, 					-- 환자대체번호
                                 anth_rcrd_ymd timestamp NOT NULL, 				-- 신체계측기록일자
                                 anth_rcrd_seq numeric(3) NOT NULL, 				-- 신체계측기록순번
                                 ht_msrm_vl varchar(10) NULL, 					-- 신장측정값			-- numeric(5, 1)  쓰레기 데이터도 그냥 넘겨달라고함
                                 wt_msrm_vl varchar(10) NULL, 					-- 체중측정값			-- numeric(5, 1)  쓰레기 데이터도 그냥 넘겨달라고함
                                 bmi_vl varchar(10) NULL, 						-- BMI값					-- numeric(5, 2)  쓰레기 데이터도 그냥 넘겨달라고함
                                 rlxt_blpr_vl varchar(10) NULL, 					-- 이완혈압값
                                 ctrt_blpr_vl varchar(10) NULL, 					-- 수축혈압값			-- numeric(5) 쓰레기 데이터도 그냥 넘겨달라고함
                                 ecog_cd varchar(20) NULL, 						-- ECOG코드
                                 ecog_nm varchar(200) NULL, 						-- ECOG명
                                 crtn_dt timestamp NOT NULL, 					-- 생성일시
                                 ecog_dt varchar(20) null,						-- UI용 ECOG 참고일자날짜
                                 idx varchar(20) NULL, -- UI용 시퀀스
    SORT_SEQ NUMERIC(10,0) null, 			-- UI용 정렬용
    free_text varchar(1000) null, 			-- UI용 검색용
    CONSTRAINT gscn_diag_aninf_pk PRIMARY KEY (hosp_cd, pt_no, anth_rcrd_ymd, anth_rcrd_seq)
);
