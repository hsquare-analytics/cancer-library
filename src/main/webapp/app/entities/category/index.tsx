import React from 'react';
import { Route } from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';

import Category from './category';

const LibraryRoutes = () => (
  <ErrorBoundaryRoutes>
    <Route index element={<Category />} />
  </ErrorBoundaryRoutes>
);

export default LibraryRoutes;
