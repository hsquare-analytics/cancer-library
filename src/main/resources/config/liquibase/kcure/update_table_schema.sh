#!/bin/sh

array=(
cncr_rgst #00
gscn_pt_hlinf #01
gscn_pt_fmht #02
gscn_diag_aninf #03
gscn_diag_inf #04
gscn_diag_stag #05
gscn_diag_mtst #06
gscn_exam_diag #07
gscn_exam_imag #08
gscn_exam_impt #09
gscn_exam_mlpt #10
gscn_exam_byps #11
gscn_exam_hpli #12
gscn_exam_gtsp #13
gscn_exam_eus #14
gscn_trtm_oprt #15
gscn_trtm_srpr #16
gscn_exam_sgpt #17
gscn_diag_afoc #18
gscn_trtm_bltr #19
gscn_trtm_drin #20
gscn_trtm_antp #21
gscn_trtm_rd #22
gscn_fuor_rlps #23
)

cat /dev/null > update_table_schema.sql
for name in "${array[@]}"
do
DDLScript=$(cat <<EOF
 --- ${name}
DROP TABLE IF EXISTS gscn.${name}_updated;

CREATE TABLE gscn.${name}_updated AS TABLE gscn.${name} WITH NO DATA;

ALTER TABLE gscn.${name}_updated  ADD COLUMN STATUS CHARACTER VARYING(50);
ALTER TABLE gscn.${name}_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.${name}_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.${name}_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.${name}_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---\n
)

printf "$DDLScript"
echo "$DDLScript" >> update_table_schema.sql
done

