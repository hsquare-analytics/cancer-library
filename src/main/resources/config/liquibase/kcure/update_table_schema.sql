 --- cncr_rgst
DROP TABLE IF EXISTS gscn.cncr_rgst_updated;

CREATE TABLE gscn.cncr_rgst_updated AS TABLE gscn.cncr_rgst WITH NO DATA;

ALTER TABLE gscn.cncr_rgst_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.cncr_rgst_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_pt_hlinf
DROP TABLE IF EXISTS gscn.gscn_pt_hlinf_updated;

CREATE TABLE gscn.gscn_pt_hlinf_updated AS TABLE gscn.gscn_pt_hlinf WITH NO DATA;

ALTER TABLE gscn.gscn_pt_hlinf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_pt_hlinf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_pt_fmht
DROP TABLE IF EXISTS gscn.gscn_pt_fmht_updated;

CREATE TABLE gscn.gscn_pt_fmht_updated AS TABLE gscn.gscn_pt_fmht WITH NO DATA;

ALTER TABLE gscn.gscn_pt_fmht_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_pt_fmht_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_diag_aninf
DROP TABLE IF EXISTS gscn.gscn_diag_aninf_updated;

CREATE TABLE gscn.gscn_diag_aninf_updated AS TABLE gscn.gscn_diag_aninf WITH NO DATA;

ALTER TABLE gscn.gscn_diag_aninf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_aninf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_diag_inf
DROP TABLE IF EXISTS gscn.gscn_diag_inf_updated;

CREATE TABLE gscn.gscn_diag_inf_updated AS TABLE gscn.gscn_diag_inf WITH NO DATA;

ALTER TABLE gscn.gscn_diag_inf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_inf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_diag_inf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_inf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_diag_stag
DROP TABLE IF EXISTS gscn.gscn_diag_stag_updated;

CREATE TABLE gscn.gscn_diag_stag_updated AS TABLE gscn.gscn_diag_stag WITH NO DATA;

ALTER TABLE gscn.gscn_diag_stag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_stag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_diag_stag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_stag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_diag_mtst
DROP TABLE IF EXISTS gscn.gscn_diag_mtst_updated;

CREATE TABLE gscn.gscn_diag_mtst_updated AS TABLE gscn.gscn_diag_mtst WITH NO DATA;

ALTER TABLE gscn.gscn_diag_mtst_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_mtst_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_diag_mtst_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_mtst_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_diag
DROP TABLE IF EXISTS gscn.gscn_exam_diag_updated;

CREATE TABLE gscn.gscn_exam_diag_updated AS TABLE gscn.gscn_exam_diag WITH NO DATA;

ALTER TABLE gscn.gscn_exam_diag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_diag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_diag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_diag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_imag
DROP TABLE IF EXISTS gscn.gscn_exam_imag_updated;

CREATE TABLE gscn.gscn_exam_imag_updated AS TABLE gscn.gscn_exam_imag WITH NO DATA;

ALTER TABLE gscn.gscn_exam_imag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_imag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_imag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_imag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_impt
DROP TABLE IF EXISTS gscn.gscn_exam_impt_updated;

CREATE TABLE gscn.gscn_exam_impt_updated AS TABLE gscn.gscn_exam_impt WITH NO DATA;

ALTER TABLE gscn.gscn_exam_impt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_impt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_impt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_impt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_mlpt
DROP TABLE IF EXISTS gscn.gscn_exam_mlpt_updated;

CREATE TABLE gscn.gscn_exam_mlpt_updated AS TABLE gscn.gscn_exam_mlpt WITH NO DATA;

ALTER TABLE gscn.gscn_exam_mlpt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_mlpt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_mlpt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_mlpt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_byps
DROP TABLE IF EXISTS gscn.gscn_exam_byps_updated;

CREATE TABLE gscn.gscn_exam_byps_updated AS TABLE gscn.gscn_exam_byps WITH NO DATA;

ALTER TABLE gscn.gscn_exam_byps_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_byps_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_byps_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_byps_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_hpli
DROP TABLE IF EXISTS gscn.gscn_exam_hpli_updated;

CREATE TABLE gscn.gscn_exam_hpli_updated AS TABLE gscn.gscn_exam_hpli WITH NO DATA;

ALTER TABLE gscn.gscn_exam_hpli_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_hpli_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_hpli_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_hpli_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_gtsp
DROP TABLE IF EXISTS gscn.gscn_exam_gtsp_updated;

CREATE TABLE gscn.gscn_exam_gtsp_updated AS TABLE gscn.gscn_exam_gtsp WITH NO DATA;

ALTER TABLE gscn.gscn_exam_gtsp_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_gtsp_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_gtsp_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_gtsp_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_eus
DROP TABLE IF EXISTS gscn.gscn_exam_eus_updated;

CREATE TABLE gscn.gscn_exam_eus_updated AS TABLE gscn.gscn_exam_eus WITH NO DATA;

ALTER TABLE gscn.gscn_exam_eus_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_eus_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_eus_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_eus_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_oprt
DROP TABLE IF EXISTS gscn.gscn_trtm_oprt_updated;

CREATE TABLE gscn.gscn_trtm_oprt_updated AS TABLE gscn.gscn_trtm_oprt WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_oprt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_oprt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_oprt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_oprt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_srpr
DROP TABLE IF EXISTS gscn.gscn_trtm_srpr_updated;

CREATE TABLE gscn.gscn_trtm_srpr_updated AS TABLE gscn.gscn_trtm_srpr WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_srpr_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_srpr_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_srpr_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_srpr_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_exam_sgpt
DROP TABLE IF EXISTS gscn.gscn_exam_sgpt_updated;

CREATE TABLE gscn.gscn_exam_sgpt_updated AS TABLE gscn.gscn_exam_sgpt WITH NO DATA;

ALTER TABLE gscn.gscn_exam_sgpt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_sgpt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_exam_sgpt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_exam_sgpt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_diag_afoc
DROP TABLE IF EXISTS gscn.gscn_diag_afoc_updated;

CREATE TABLE gscn.gscn_diag_afoc_updated AS TABLE gscn.gscn_diag_afoc WITH NO DATA;

ALTER TABLE gscn.gscn_diag_afoc_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_afoc_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_diag_afoc_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_diag_afoc_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_bltr
DROP TABLE IF EXISTS gscn.gscn_trtm_bltr_updated;

CREATE TABLE gscn.gscn_trtm_bltr_updated AS TABLE gscn.gscn_trtm_bltr WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_bltr_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_bltr_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_bltr_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_bltr_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_drin
DROP TABLE IF EXISTS gscn.gscn_trtm_drin_updated;

CREATE TABLE gscn.gscn_trtm_drin_updated AS TABLE gscn.gscn_trtm_drin WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_drin_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_drin_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_drin_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_drin_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_antp
DROP TABLE IF EXISTS gscn.gscn_trtm_antp_updated;

CREATE TABLE gscn.gscn_trtm_antp_updated AS TABLE gscn.gscn_trtm_antp WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_antp_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_antp_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_antp_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_antp_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_trtm_rd
DROP TABLE IF EXISTS gscn.gscn_trtm_rd_updated;

CREATE TABLE gscn.gscn_trtm_rd_updated AS TABLE gscn.gscn_trtm_rd WITH NO DATA;

ALTER TABLE gscn.gscn_trtm_rd_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_rd_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_trtm_rd_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_trtm_rd_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gscn_fuor_rlps
DROP TABLE IF EXISTS gscn.gscn_fuor_rlps_updated;

CREATE TABLE gscn.gscn_fuor_rlps_updated AS TABLE gscn.gscn_fuor_rlps WITH NO DATA;

ALTER TABLE gscn.gscn_fuor_rlps_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_fuor_rlps_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.gscn_fuor_rlps_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.gscn_fuor_rlps_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

