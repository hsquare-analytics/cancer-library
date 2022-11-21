#!/bin/sh

array=(
cncr_rgst #00
gstr_pt_hlinf #01
gstr_pt_fmht #02
gstr_diag_aninf #03
gstr_diag_inf #04
gstr_diag_stag #05
gstr_diag_mtst #06
gstr_exam_diag #07
gstr_exam_imag #08
gstr_exam_impt #09
gstr_exam_mlpt #10
)

cat /dev/null > update_table_schema.sql
for name in "${array[@]}"
do
DDLScript=$(cat <<EOF
 --- ${name}
DROP TABLE IF EXISTS gstr.${name}_updated;

CREATE TABLE gstr.${name}_updated AS TABLE gstr.${name} WITH NO DATA;

ALTER TABLE gstr.${name}_updated  ADD COLUMN CREATED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.${name}_updated  ADD COLUMN CREATED_DATE TIMESTAMP;
ALTER TABLE gstr.${name}_updated  ADD COLUMN LAST_MODIFIED_BY CHARACTER VARYING(50);
ALTER TABLE gstr.${name}_updated  ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;
---\n
)

printf "$DDLScript"
echo "$DDLScript" >> update_table_schema.sql
done

