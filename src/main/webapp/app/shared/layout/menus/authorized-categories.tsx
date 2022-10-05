import React, {useEffect} from 'react';
import {translate} from 'react-jhipster';
import {NavDropdown} from './menu-components';
import MenuItem from "app/shared/layout/menus/menu-item";
import {useAppDispatch, useAppSelector} from "app/config/store";
import {getCategories} from "app/modules/navigation/navigation.reducer";
import _ from "lodash";

export interface IUserAuthorizedCategoriesProps {
  titleTranslationKey: string;
  routerPath: string;
}

export const AuthorizedCategories = (props: IUserAuthorizedCategoriesProps) => {

  const {routerPath, titleTranslationKey} = props;

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
    name={translate(titleTranslationKey)}
    id="entity-menu"
    data-cy="entity"
    style={{maxHeight: '80vh', overflow: 'auto'}}
  >
    {
      categoryList.length !== 0 ? _.uniqBy([...categoryList], 'id').sort((a, b) => a.id - b.id).map(category => {
        return <MenuItem key={category} icon="asterisk" to={`${routerPath}/${category.id}`}>
          {category.title}
        </MenuItem>
      }) : null}
  </NavDropdown>
};

