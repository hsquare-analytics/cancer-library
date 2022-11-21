 --- cncr_rgst
DROP TABLE IF EXISTS gstr.cncr_rgst_updated;

CREATE TABLE gstr.cncr_rgst_updated AS TABLE gstr.cncr_rgst WITH NO DATA;

ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_pt_hlinf
DROP TABLE IF EXISTS gstr.gstr_pt_hlinf_updated;

CREATE TABLE gstr.gstr_pt_hlinf_updated AS TABLE gstr.gstr_pt_hlinf WITH NO DATA;

ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_pt_fmht
DROP TABLE IF EXISTS gstr.gstr_pt_fmht_updated;

CREATE TABLE gstr.gstr_pt_fmht_updated AS TABLE gstr.gstr_pt_fmht WITH NO DATA;

ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_diag_aninf
DROP TABLE IF EXISTS gstr.gstr_diag_aninf_updated;

CREATE TABLE gstr.gstr_diag_aninf_updated AS TABLE gstr.gstr_diag_aninf WITH NO DATA;

ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_diag_inf
DROP TABLE IF EXISTS gstr.gstr_diag_inf_updated;

CREATE TABLE gstr.gstr_diag_inf_updated AS TABLE gstr.gstr_diag_inf WITH NO DATA;

ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_diag_stag
DROP TABLE IF EXISTS gstr.gstr_diag_stag_updated;

CREATE TABLE gstr.gstr_diag_stag_updated AS TABLE gstr.gstr_diag_stag WITH NO DATA;

ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_diag_mtst
DROP TABLE IF EXISTS gstr.gstr_diag_mtst_updated;

CREATE TABLE gstr.gstr_diag_mtst_updated AS TABLE gstr.gstr_diag_mtst WITH NO DATA;

ALTER TABLE gstr.gstr_diag_mtst_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_mtst_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_mtst_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_mtst_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_exam_diag
DROP TABLE IF EXISTS gstr.gstr_exam_diag_updated;

CREATE TABLE gstr.gstr_exam_diag_updated AS TABLE gstr.gstr_exam_diag WITH NO DATA;

ALTER TABLE gstr.gstr_exam_diag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_diag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_exam_diag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_diag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_exam_imag
DROP TABLE IF EXISTS gstr.gstr_exam_imag_updated;

CREATE TABLE gstr.gstr_exam_imag_updated AS TABLE gstr.gstr_exam_imag WITH NO DATA;

ALTER TABLE gstr.gstr_exam_imag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_imag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_exam_imag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_imag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_exam_impt
DROP TABLE IF EXISTS gstr.gstr_exam_impt_updated;

CREATE TABLE gstr.gstr_exam_impt_updated AS TABLE gstr.gstr_exam_impt WITH NO DATA;

ALTER TABLE gstr.gstr_exam_impt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_impt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_exam_impt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_impt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

 --- gstr_exam_mlpt
DROP TABLE IF EXISTS gstr.gstr_exam_mlpt_updated;

CREATE TABLE gstr.gstr_exam_mlpt_updated AS TABLE gstr.gstr_exam_mlpt WITH NO DATA;

ALTER TABLE gstr.gstr_exam_mlpt_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_mlpt_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_exam_mlpt_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_exam_mlpt_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---

