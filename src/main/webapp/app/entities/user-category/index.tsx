import React from 'react';
import { Route } from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';

import UserCategory from './user-category';
import UserCategoryDetail from './user-category-detail';
import UserCategoryUpdate from './user-category-update';
import UserCategoryDeleteDialog from './user-category-delete-dialog';

const UserCategoryRoutes = () => (
  <ErrorBoundaryRoutes>
    <Route index element={<UserCategory />} />
    <Route path="new" element={<UserCategoryUpdate />} />
    <Route path=":id">
      <Route index element={<UserCategoryDetail />} />
      <Route path="edit" element={<UserCategoryUpdate />} />
      <Route path="delete" element={<UserCategoryDeleteDialog />} />
    </Route>
  </ErrorBoundaryRoutes>
);

export default UserCategoryRoutes;
