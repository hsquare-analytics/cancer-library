import {ReducersMapObject} from '@reduxjs/toolkit';
import {loadingBarReducer as loadingBar} from 'react-redux-loading-bar';

import locale from './locale';
import authentication from './authentication';
import applicationProfile from './application-profile';

import administration from 'app/modules/administration/administration.reducer';
import userManagement from 'app/modules/administration/user-management/user-management.reducer';
import audit from 'app/modules/administration/audit/audit.reducer';
import register from 'app/modules/account/register/register.reducer';
import activate from 'app/modules/account/activate/activate.reducer';
import password from 'app/modules/account/password/password.reducer';
import settings from 'app/modules/account/settings/settings.reducer';
import passwordReset from 'app/modules/account/password-reset/password-reset.reducer';
import entitiesReducers from 'app/entities/entities-reducers';
/* jhipster-needle-add-reducer-import - JHipster will add reducer here */
import navigation from "app/modules/navigation/navigation.reducer";
import patient from "app/entities/patient/patient.reducer";
import datasourceContainer from "app/modules/datasource-editor/reducer/datasource.container.reducer";
import datasourcePatient from "app/modules/datasource-editor/reducer/datasource.patient.reducer";
import datasourceStatus from "app/modules/datasource-editor/reducer/datasource.status.reducer";
import userPatientDndGrid from "app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer";
import rowCommentReducer from "app/modules/row-comment-editor/row-comment.reducer";
import reviewerStatistics from "app/modules/reviewer-statistics/reviewer-statistics.reducer";

const rootReducer: ReducersMapObject = {
  authentication,
  locale,
  applicationProfile,
  administration,
  userManagement,
  register,
  activate,
  passwordReset,
  password,
  settings,
  loadingBar,
  navigation,
  /* jhipster-needle-add-reducer-combine - JHipster will add reducer here */
  audit,
  ...entitiesReducers,
  patient,
  datasourceContainer,
  datasourcePatient,
  userPatientDndGrid,
  datasourceStatus,
  rowCommentReducer,
  reviewerStatistics
};

export default rootReducer;
