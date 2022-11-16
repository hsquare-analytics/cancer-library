#!/bin/sh

array=(
cncr_rgst
gstr_pt_hlinf
gstr_pt_fmht
gstr_diag_aninf
gstr_diag_inf
gstr_diag_stag
)

cat /dev/null > meta/99_update_table_schema.sql
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
echo "$DDLScript" >> meta/99_update_table_schema.sql
done

