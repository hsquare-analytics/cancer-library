-- 00
DROP TABLE IF EXISTS gstr.cncr_rgst_updated;

CREATE TABLE gstr.cncr_rgst_updated AS
    TABLE gstr.cncr_rgst
    WITH NO DATA;

ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.cncr_rgst_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

-- 01
DROP TABLE IF EXISTS gstr.gstr_pt_hlinf_updated;

CREATE TABLE gstr.gstr_pt_hlinf_updated AS
    TABLE gstr.gstr_pt_hlinf
    WITH NO DATA;

ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_hlinf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

-- 02
DROP TABLE IF EXISTS gstr.gstr_pt_fmht_updated;

CREATE TABLE gstr.gstr_pt_fmht_updated AS
    TABLE gstr.gstr_pt_fmht
    WITH NO DATA;

ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_pt_fmht_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

-- 03
DROP TABLE IF EXISTS gstr.gstr_diag_aninf_updated;

CREATE TABLE gstr.gstr_diag_aninf_updated AS
    TABLE gstr.gstr_diag_aninf
    WITH NO DATA;

ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_aninf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

-- 04
DROP TABLE IF EXISTS gstr.gstr_diag_inf_updated;

CREATE TABLE gstr.gstr_diag_inf_updated AS
    TABLE gstr.gstr_diag_inf
    WITH NO DATA;

ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_inf_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

-- 05
DROP TABLE IF EXISTS gstr.gstr_diag_stag_updated;

CREATE TABLE gstr.gstr_diag_stag_updated AS
    TABLE gstr.gstr_diag_stag
    WITH NO DATA;

ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.gstr_diag_stag_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
