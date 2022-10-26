import React from 'react';
import {Route, useLocation} from 'react-router-dom';
import Loadable from 'react-loadable';

import Login from 'app/modules/login/login';
import Register from 'app/modules/account/register/register';
import Activate from 'app/modules/account/activate/activate';
import PasswordResetInit from 'app/modules/account/password-reset/init/password-reset-init';
import PasswordResetFinish from 'app/modules/account/password-reset/finish/password-reset-finish';
import Logout from 'app/modules/login/logout';
import Home from 'app/modules/home/home';
import EntitiesRoutes from 'app/entities/routes';
import PrivateRoute from 'app/shared/auth/private-route';
import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';
import PageNotFound from 'app/shared/error/page-not-found';
import {AUTHORITIES} from 'app/config/constants';
import {sendActivity} from 'app/config/websocket-middleware';
import AccessiblePatient from "app/modules/datasource-editor/accessible-patient";
import UserPatientDndGrid from "app/modules/user-patient-dnd-grid/user-patient-dnd-grid";

const loading = <div>loading ...</div>;

const Account = Loadable({
  loader: () => import(/* webpackChunkName: "account" */ 'app/modules/account'),
  loading: () => loading,
});

const Admin = Loadable({
  loader: () => import(/* webpackChunkName: "administration" */ 'app/modules/administration'),
  loading: () => loading,
});

const AppRoutes = () => {
  const location = useLocation();
  React.useEffect(() => {
    sendActivity(location.pathname);
  }, [location]);
  return (
    <div className="view-routes">
      <ErrorBoundaryRoutes>
        <Route index element={<Home/>}/>
        <Route path="login" element={<Login/>}/>
        <Route path="logout" element={<Logout/>}/>
        <Route path="account">
          <Route
            path="*"
            element={
              <PrivateRoute hasAnyAuthorities={[AUTHORITIES.ADMIN, AUTHORITIES.USER]}>
                <Account/>
              </PrivateRoute>
            }
          />
          <Route path="register" element={<Register/>}/>
          <Route path="activate" element={<Activate/>}/>
          <Route path="reset">
            <Route path="request" element={<PasswordResetInit/>}/>
            <Route path="finish" element={<PasswordResetFinish/>}/>
          </Route>
        </Route>
        <Route
          path="admin/*"
          element={
            <PrivateRoute hasAnyAuthorities={[AUTHORITIES.ADMIN]}>
              <Admin/>
              <EntitiesRoutes/>
            </PrivateRoute>
          }
        />
        <Route
          path="datasource-editor"
          element={
            <PrivateRoute hasAnyAuthorities={[AUTHORITIES.ADMIN, AUTHORITIES.USER, AUTHORITIES.SUPERVISOR]}>
              <AccessiblePatient/>
            </PrivateRoute>
          }
        >
        </Route>
        <Route
          path="user-patient-authorization-editor"
          element={
            <PrivateRoute hasAnyAuthorities={[AUTHORITIES.ADMIN, AUTHORITIES.USER, AUTHORITIES.SUPERVISOR]}>
              <UserPatientDndGrid/>
            </PrivateRoute>
          }
        >
        </Route>
        <Route path="*" element={<PageNotFound/>}/>
      </ErrorBoundaryRoutes>
    </div>
  );
};

export default AppRoutes;
