import React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Box from '@mui/material/Box';
import './patient-profile-card-detail.scss';
import {createTheme, ThemeProvider} from '@mui/material/styles';
import Grid from '@mui/material/Grid';
import {GridCommentItem} from "app/modules/datasource-editor/patient-profile/grid-item/grid-comment-item";
import {GridDeclineReasonItem} from "app/modules/datasource-editor/patient-profile/grid-item/grid-decline-reason-item";
import {GridRowCommentItem} from "app/modules/datasource-editor/patient-profile/grid-item/grid-row-comment-item";
import {PatientProfileCalendar} from "app/modules/datasource-editor/patient-profile/component/patient-profile-calendar";
import {PatientProfileCardColumns} from "app/modules/datasource-editor/patient-profile/component/patient-profile-card-columns";


const theme = createTheme({
  components: {
    MuiInput: {
      styleOverrides: {
        root: {
          // '&:before': {
          //   borderBottom: '1px dotted rgba(0, 0, 0, 0.42)',
          // },
          // '&:hover:not(.Mui-disabled):before': {
          //   borderBottom: '1px dotted rgba(0, 0, 0, 0.42)',
          // },
        },
      },
    },
  },
});


export const PatientProfileCardDetail = (props) => {
  return (
    <div>
      <ThemeProvider theme={theme}>
        <Box>
          <Card variant="outlined" className="box-patient-profile">
            <div className="d-flex align-items-center">
              <PatientProfileCalendar/>
              <PatientProfileCardColumns/>
            </div>
            <CardContent>
              <Box>
                <Grid container spacing={2}>
                  <GridCommentItem xs={4}/>
                  <GridDeclineReasonItem xs={4}/>
                  <GridRowCommentItem xs={4}/>
                </Grid>
              </Box>
            </CardContent>
          </Card>
        </Box>
      </ThemeProvider>
    </div>
  );
};

export default PatientProfileCardDetail;
