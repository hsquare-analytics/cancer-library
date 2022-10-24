import React from 'react';
import {Translate} from 'react-jhipster';

import {NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

export const DatasourceEditorMenu = () => (
  <NavItem id="datasource-editor-menu">
    <NavLink tag={Link} to="/datasource-editor" className="d-flex align-items-center">
      <FontAwesomeIcon icon="home"/>
      <span>
        <Translate contentKey="global.menu.patientTableEditor">Patient Table Editor</Translate>
      </span>
    </NavLink>
  </NavItem>
);
