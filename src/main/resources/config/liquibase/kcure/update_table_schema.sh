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
)

cat /dev/null > update_table_schema.sql
for name in "${array[@]}"
do
DDLScript=$(cat <<EOF
 --- ${name}
DROP TABLE IF EXISTS gscn.${name}_updated;

CREATE TABLE gscn.${name}_updated AS TABLE gscn.${name} WITH NO DATA;

ALTER TABLE gscn.${name}_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.${name}_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gscn.${name}_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gscn.${name}_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---\n
)

printf "$DDLScript"
echo "$DDLScript" >> update_table_schema.sql
done

