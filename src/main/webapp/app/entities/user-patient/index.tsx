import React from 'react';
import { Route } from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';

import UserPatient from './user-patient';
import UserPatientDetail from './user-patient-detail';
import UserPatientUpdate from './user-patient-update';
import UserPatientDeleteDialog from './user-patient-delete-dialog';

const PointRoutes = () => (
  <ErrorBoundaryRoutes>
    <Route index element={<UserPatient />} />
    <Route path="new" element={<UserPatientUpdate />} />
    <Route path=":id">
      <Route index element={<UserPatientDetail />} />
      <Route path="edit" element={<UserPatientUpdate />} />
      <Route path="delete" element={<UserPatientDeleteDialog />} />
    </Route>
  </ErrorBoundaryRoutes>
);

export default PointRoutes;
