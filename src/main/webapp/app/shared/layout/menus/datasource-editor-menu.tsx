import React from 'react';
import { Translate } from 'react-jhipster';

import { NavItem, NavLink } from 'reactstrap';
import { NavLink as Link } from 'react-router-dom';
import editIcon from '../../../asset/img/icon-data-edit.svg';

export const DatasourceEditorMenu = () => (
  <NavItem id="datasource-editor-menu">
    <NavLink tag={Link} to="/datasource-editor" className="d-flex align-items-center">
      <img src={editIcon} alt="데이터 편집 모듈" style={{ transform: 'scale(0.95) translateX(2px)' }} />
      <span>
        <Translate contentKey="global.menu.datasource">Patient Table Editor</Translate>
      </span>
    </NavLink>
  </NavItem>
);
