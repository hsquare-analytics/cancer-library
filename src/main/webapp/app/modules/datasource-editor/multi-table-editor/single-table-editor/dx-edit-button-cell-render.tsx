import React from 'react';
import {KCURE_PREFIX} from "app/config/datasource-constants";
import Button from '@mui/material/Button';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import Stack from '@mui/material/Stack';
import {useAppSelector} from "app/config/store";
import {hasAnyAuthority} from "app/shared/auth/private-route";
import {AUTHORITIES} from "app/config/constants";

export interface IDxEditButtonCellRenderProps {
  data: any;
  dataGridRef: any;
}

const DxEditButtonCellRender = (props: IDxEditButtonCellRenderProps) => {
  const {data, dataGridRef} = props;

  const login = useAppSelector(state => state.authentication.account.login);

  const isManager = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN, AUTHORITIES.SUPERVISOR])
  );
  const row = data.row.data;
  const rowIndex = data.rowIndex;

  if (!row || !row.idx) {
    return null;
  }

  const canManaging = row.idx.includes(KCURE_PREFIX) && (isManager || row['created_by'] === login);

  return (
    <Stack spacing={1} direction="row">
      <Button variant="text" style={{maxHeight: '30px', minHeight: '30px'}}
              onClick={() => dataGridRef.current.instance.editRow(rowIndex)}>
        <FontAwesomeIcon icon="pencil"/>
      </Button>
      {canManaging && (
        <Button
          variant="text"
          style={{maxWidth: '30px', maxHeight: '30px', minWidth: '30px', minHeight: '30px'}}
          onClick={() => dataGridRef.current.instance.deleteRow(rowIndex)}
        >
          <FontAwesomeIcon icon="trash"/>
        </Button>
      )}
    </Stack>
  );
};

export default DxEditButtonCellRender;
