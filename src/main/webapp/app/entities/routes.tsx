import React from 'react';
import {Route} from 'react-router-dom';

import ErrorBoundaryRoutes from 'app/shared/error/error-boundary-routes';
import Library from './library';
import Category from "./category";
import Item from "./item";
import UserCategory from "./user-category";
import Subject from "app/entities/subject";
import Topic from "app/entities/topic";
import Group from "app/entities/group";
/* jhipster-needle-add-route-import - JHipster will add routes here */

export default () => {
  return (
    <div>
      <ErrorBoundaryRoutes>
        {/* prettier-ignore */}
        <Route path="subject/*" element={<Subject />} />
        <Route path="topic/*" element={<Topic />} />
        <Route path="library/*" element={<Library />} />
        <Route path="category/*" element={<Category />} />
        <Route path="item/*" element={<Item />} />
        <Route path="group/*" element={<Group />} />
        <Route path="user-category/*" element={<UserCategory />} />
        {/* jhipster-needle-add-route-path - JHipster will add routes here */}
      </ErrorBoundaryRoutes>
    </div>
  );
};
