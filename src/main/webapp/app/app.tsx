import 'react-toastify/dist/ReactToastify.css';
import './app.scss';
import 'devextreme/dist/css/dx.material.blue.light.css';
import './app-override.scss';
import {createTheme, ThemeProvider} from '@mui/material/styles';

import 'app/config/dayjs.ts';

import React, {useCallback, useEffect} from 'react';
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

import CssBaseline from '@mui/material/CssBaseline';
import {getDesignTokens} from 'app/shared/util/mui-theme';
import {PaletteMode} from '@mui/material';
import ToggleTheme from 'app/shared/layout/header/toggle-theme';
import dxPopup from "devextreme/ui/popup";
import {Cookies} from "react-cookie";

const cookies = new Cookies();

export const setCookie = (name: string, value: string, options: any) => {
    cookies.set(name, value, options);
}

export const getCookie = (name: string) => {
    return cookies.get(name);
}

dxPopup.defaultOptions({
  options: {animation: null}
});

const baseHref = document.querySelector('base').getAttribute('href').replace(/\/$/, '');

declare module '@mui/material/styles' {
  interface Theme {
    sidebar: {
      backgroundColor: string;
    };
  }

  // allow configuration using `createTheme`
  interface ThemeOptions {
    sidebar?: {
      backgroundColor?: string;
    };
  }
}

export const App = () => {
  const dispatch = useAppDispatch();

  // todo: 유저가 테마를 설정 한 이력이 있는경우 저장된 테마 정보를 불러오게 한다
  const [mode, setMode] = React.useState<PaletteMode>('light');

  const theme = React.useMemo(() => createTheme(getDesignTokens(mode)), [mode]);

  useEffect(() => {
    dispatch(getSession());
    dispatch(getProfile());
    setMode(getCookie('theme') as PaletteMode);
  }, []);

  const onToggleMode = useCallback(
    (value: PaletteMode) => {
      setMode(value);

      const bodyClassList = document.body.classList;

      if (!bodyClassList.contains('dark')) {
        setCookie('theme', 'dark', {path: baseHref});
        bodyClassList.add('dark');
      } else {
        setCookie('theme', 'light', {path: baseHref});
        bodyClassList.remove('dark');
      }
    },
    [mode]
  );

  const currentLocale = useAppSelector(state => state.locale.currentLocale);
  const isAuthenticated = useAppSelector(state => state.authentication.isAuthenticated);
  const isAdmin = useAppSelector(state => hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.ADMIN]));
  const hasSuAuthority = useAppSelector(state =>
    hasAnyAuthority(state.authentication.account.authorities, [AUTHORITIES.SUPERVISOR, AUTHORITIES.ADMIN])
  );
  const ribbonEnv = useAppSelector(state => state.applicationProfile.ribbonEnv);
  const isInProduction = useAppSelector(state => state.applicationProfile.inProduction);
  const isOpenAPIEnabled = useAppSelector(state => state.applicationProfile.isOpenAPIEnabled);

  return (
    <BrowserRouter basename={baseHref}>
      <ThemeProvider theme={theme}>
        <CssBaseline/>
        {/* mode className 을 app-container 에 추가한다. 'dark' | 'light' */}
        <div className={`app-container ${mode} ${isAuthenticated ? '' : 'no-auth'}`}>
          <ToastContainer
            position={toast.POSITION.TOP_RIGHT}
            className="toastify-container"
            theme="light"
            toastClassName="toastify-toast"
            limit={5}
          />
          <ErrorBoundary>
            <Header
              isAuthenticated={isAuthenticated}
              isAdmin={isAdmin}
              hasSuAuthority={hasSuAuthority}
              currentLocale={currentLocale}
              ribbonEnv={ribbonEnv}
              isInProduction={isInProduction}
              isOpenAPIEnabled={isOpenAPIEnabled}
            >
              <ToggleTheme mode={mode} onToggleMode={onToggleMode}/>
            </Header>
          </ErrorBoundary>

          <div className="container-fluid view-container" id="app-view-container">
            <ErrorBoundary>
              <AppRoutes/>
            </ErrorBoundary>
          </div>
        </div>
      </ThemeProvider>
    </BrowserRouter>
  );
};

export default App;
