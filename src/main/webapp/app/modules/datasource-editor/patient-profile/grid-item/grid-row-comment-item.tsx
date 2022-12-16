import React, {useEffect, useState} from "react";
import Typography from '@mui/material/Typography';
import {translate} from 'react-jhipster';
import Box from '@mui/material/Box';
import TextArea from 'devextreme-react/text-area';
import IconButton from '@mui/material/IconButton';
import '../patient-profile-card-detail.scss';
import {useAppDispatch, useAppSelector} from "app/config/store";
import {IPatient} from "app/shared/model/patient.model";
import Grid from '@mui/material/Grid';
import {Popup} from 'devextreme-react/popup';
import {getEntities} from "app/modules/row-comment-editor/row-comment.reducer";
import {IComment} from "app/shared/model/comment.model";
import RemoveRedEyeOutlinedIcon from '@mui/icons-material/RemoveRedEyeOutlined';
import CircularProgress from '@mui/material/CircularProgress';

interface IGridRowCommentITem {
  xs: number;
}

export const GridRowCommentItem = (props: IGridRowCommentITem) => {
  const dispatch = useAppDispatch();

  const {xs} = props;

  const patient = useAppSelector<IPatient>(state => state.datasourcePatient.entity);
  const commentEntitites = useAppSelector<IComment[]>(state => state.rowCommentReducer.entities);
  const loading = useAppSelector(state => state.rowCommentReducer.loading);

  const [value, setValue] = useState('');
  const [popupVisible, setPopupVisible] = useState(false);

  useEffect(() => {
    dispatch(getEntities(patient.ptNo));
  }, []);

  useEffect(() => {
    const result = commentEntitites?.map(comment => {
      return `* ${comment.category.attribute.caption} \n ${comment.comment}`;
    }).join("\n\n");

    setValue(result);
  }, [commentEntitites]);


  return <Grid item xs={xs}>
    <Typography color="text.secondary">
      * {translate('cancerLibraryApp.datasourceEditor.profileCard.rowComment')}
      <IconButton onClick={() => setPopupVisible(true)} style={{marginLeft: '3px'}}
                  className="icon-patient-detail">
        <RemoveRedEyeOutlinedIcon/>
      </IconButton>
    </Typography>
    {
      !loading ? <Box>
        {value && value.length > 0 ? (
          <TextArea
            id={'patient-profiel-card-detail-comment-text-area'}
            height={100}
            readOnly={true}
            value={value}
          />
        ) : (
          <Typography component="span" color="text.default">
            {translate('cancerLibraryApp.datasourceEditor.profileCard.emptyContent')}
          </Typography>
        )}
        <Popup
          visible={popupVisible}
          onHiding={() => setPopupVisible(false)}
          dragEnabled={false}
          hideOnOutsideClick={true}
          showCloseButton={false}
          showTitle={false}
          width={'60vw'}
          height={'80vh'}
        >
          <TextArea
            id={'patient-profiel-card-detail-comment-text-area'}
            height={'76vh'}
            width={'100%'}
            value={value}
          />
        </Popup>
      </Box> : <Box sx={{display: 'flex'}}>
        <CircularProgress/>
      </Box>
    }

  </Grid>
}
