import {ReducersMapObject} from '@reduxjs/toolkit';
import {loadingBarReducer as loadingBar} from 'react-redux-loading-bar';

import locale from './locale';
import authentication from './authentication';
import applicationProfile from './application-profile';

import administration from 'app/modules/administration/administration.reducer';
import userManagement from 'app/modules/administration/user-management/user-management.reducer';
import register from 'app/modules/account/register/register.reducer';
import activate from 'app/modules/account/activate/activate.reducer';
import password from 'app/modules/account/password/password.reducer';
import settings from 'app/modules/account/settings/settings.reducer';
import passwordReset from 'app/modules/account/password-reset/password-reset.reducer';
import entitiesReducers from 'app/entities/entities-reducers';
/* jhipster-needle-add-reducer-import - JHipster will add reducer here */
import navigation from "app/modules/navigation/navigation.reducer";
import patient from "app/entities/patient/patient.reducer";
import datasourceContainer from "app/modules/datasource/reducer/datasource.container.reducer";
import datasourcePatient from "app/modules/datasource/reducer/datasource.patient.reducer";
import datasourceOrigin from "app/modules/datasource/reducer/datasource.origin.reducer";
import userPatientDndGrid from "app/modules/user-patient-dnd-grid/user-patient-dnd-grid.reducer";

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
  ...entitiesReducers,
  patient,
  datasourceContainer,
  datasourcePatient,
  userPatientDndGrid,
  datasourceOrigin
};

export default rootReducer;
