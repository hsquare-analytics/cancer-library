import React, {useEffect} from 'react';
import {translate} from 'react-jhipster';
import {NavDropdown} from './menu-components';
import MenuItem from "app/shared/layout/menus/menu-item";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";

export const UserAuthorizedCategories = () => {

  const dispatch = useAppDispatch();

  const categoryList = useAppSelector(state => state.navigation.categories);

  const initStore = () => {
    dispatch(getCategories());
  };

  useEffect(() => {
    initStore();
  }, []);

  return <NavDropdown
    icon="th-list"
    name={translate('global.menu.categories.main')}
    id="entity-menu"
    data-cy="entity"
    style={{maxHeight: '80vh', overflow: 'auto'}}
  >
    {
      categoryList.length !== 0 ? categoryList.map(category => {
        return <MenuItem icon="asterisk" to={`data-editor/${category.title}`}>
          {category.title}
        </MenuItem>
      }) : null}
  </NavDropdown>
};

