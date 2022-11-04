import 'react-toastify/dist/ReactToastify.css';
import './app.scss';
import 'app/config/dayjs.ts';

import React, {useEffect} from 'react';
import {Card} from 'reactstrap';
import {BrowserRouter} from 'react-router-dom';
import {toast, ToastContainer} from 'react-toastify';

import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getSession} from 'app/shared/reducers/authentication';
import {getProfile} from 'app/shared/reducers/application-profile';
import Header from 'app/shared/layout/header/header';
import {hasAnyAuthority} from 'app/shared/auth/private-route';
import ErrorBoundary from 'app/shared/error/error-boundary';
import {AUTHORITIES} from 'app/config/constants';
import AppRoutes from 'app/app-routes';
import 'devextreme/dist/css/dx.material.blue.light.css';
import {createTheme, ThemeProvider} from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';

const theme = createTheme({
  palette: {mode: 'light'},
});

const baseHref = document.querySelector('base').getAttribute('href').replace(/\/$/, '');

export const App = () => {
  const dispatch = useAppDispatch();

  useEffect(() => {
    dispatch(getSession());
    dispatch(getProfile());
  }, []);

  const currentLocale = useAppSelector(state => state.locale.currentLocale);
  const isAuthenticated = useAppSelector(state => state.authentication.isAuthenticated);
  const isAdmin = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN]));
  const hasSuAuthority = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.SUPERVISOR, AUTHORITIES.ADMIN]));
  const ribbonEnv = useAppSelector(state => state.applicationProfile.ribbonEnv);
  const isInProduction = useAppSelector(state => state.applicationProfile.inProduction);
  const isOpenAPIEnabled = useAppSelector(state => state.applicationProfile.isOpenAPIEnabled);

  const paddingTop = '10px';
  const paddingLeft = '210px';
  return (
    <BrowserRouter basename={baseHref}>
      <ThemeProvider theme={theme}>
        <CssBaseline/>
        <div className="app-container" style={{paddingTop, paddingLeft}}>
          <ToastContainer position={toast.POSITION.TOP_RIGHT} className="toastify-container"
                          theme="light"
                          toastClassName="toastify-toast"
                          limit={5}/>
          <ErrorBoundary>
            <Header
              isAuthenticated={isAuthenticated}
              isAdmin={isAdmin}
              hasSuAuthority={hasSuAuthority}
              currentLocale={currentLocale}
              ribbonEnv={ribbonEnv}
              isInProduction={isInProduction}
              isOpenAPIEnabled={isOpenAPIEnabled}
            />
          </ErrorBoundary>
          <div className="container-fluid view-container" id="app-view-container">
            <Card className="jh-card">
              <ErrorBoundary>
                <AppRoutes/>
              </ErrorBoundary>
            </Card>
          </div>
        </div>
      </ThemeProvider>
    </BrowserRouter>
  );
};

export default App;
