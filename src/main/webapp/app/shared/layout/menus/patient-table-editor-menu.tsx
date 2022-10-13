import React from 'react';
import {Translate} from 'react-jhipster';

import {NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

export const PatientTableEditorMenu = () => (
  <NavItem>
    <NavLink tag={Link} to="/patient-table-editor" className="d-flex align-items-center">
      <FontAwesomeIcon icon="home"/>
      <span>
        <Translate contentKey="global.menu.patientTableEditor">Patient Table Editor</Translate>
      </span>
    </NavLink>
  </NavItem>
);
