import React, {useEffect} from 'react';
import {translate} from 'react-jhipster';
import {NavDropdown} from './menu-components';
import MenuItem from "app/shared/layout/menus/menu-item";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getEntities} from "app/entities/category/category.reducer";

export const AdminAuthorizedCategories = () => {

  const dispatch = useAppDispatch();

  const categoryList = useAppSelector(state => state.category.entities);

  const initStore = () => {
    if (categoryList.length === 0) {
      dispatch(getEntities({}));
    }
  };

  useEffect(() => {
    initStore();
  }, []);

  return <NavDropdown
    icon="th-list"
    name={translate('global.menu.approval-categories')}
    id="entity-menu"
    data-cy="entity"
    style={{maxHeight: '80vh', overflow: 'auto'}}
  >
    {
      categoryList.length !== 0 ? categoryList.map(category => {
        return <MenuItem key={category} icon="asterisk" to={`admin/data-review/${category.id}`}>
          {category.title}
        </MenuItem>
      }) : null}
  </NavDropdown>
};

