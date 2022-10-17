import React from 'react';
import {Translate} from 'react-jhipster';

import {NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

export const UserPatientDndGridMenu = () => (
  <NavItem id="user-patient-dnd-grid-menu">
    <NavLink tag={Link} to="/user-patient-authorization-editor" className="d-flex align-items-center">
      <FontAwesomeIcon icon="home"/>
      <span>
        <Translate contentKey="global.menu.userPatientAuthorizationEditor">Patient Table Editor</Translate>
      </span>
    </NavLink>
  </NavItem>
);
