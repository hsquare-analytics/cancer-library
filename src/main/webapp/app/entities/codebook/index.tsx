import React from 'react';
import {Route} from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';

import Codebook from './codebook';
import CodebookDetail from './codebook-detail';
import CodebookUpdate from './codebook-update';
import CodebookDeleteDialog from './codebook-delete-dialog';

const CodebookRoutes = () => (
  <ErrorBoundaryRoutes>
    <Route index element={<Codebook />} />
    <Route path="new" element={<CodebookUpdate />} />
    <Route path=":id">
      <Route index element={<CodebookDetail />} />
      <Route path="edit" element={<CodebookUpdate />} />
      <Route path="delete" element={<CodebookDeleteDialog />} />
    </Route>
  </ErrorBoundaryRoutes>
);

export default CodebookRoutes;
