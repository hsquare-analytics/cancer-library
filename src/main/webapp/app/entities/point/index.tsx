import React from 'react';
import { Route } from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';

import Point from './point';

const PointRoutes = () => (
  <ErrorBoundaryRoutes>
    <Route index element={<Point />} />
  </ErrorBoundaryRoutes>
);

export default PointRoutes;
