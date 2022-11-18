import React from 'react';
import { Translate } from 'react-jhipster';

import { NavItem, NavLink } from 'reactstrap';
import { NavLink as Link } from 'react-router-dom';
import patientGridIcon from '../../../asset/img/icon-patient.svg';

export const UserPatientDndGridMenu = () => (
  <NavItem id="user-patient-dnd-grid-menu">
    <NavLink tag={Link} to="/user-patient-authorization-editor" className="d-flex align-items-center">
      <img src={patientGridIcon} alt="환자 권한 설정" style={{ transform: 'scale(0.8) translateX(2px)' }} />
      <span>
        <Translate contentKey="global.menu.userPatientAuthorizationEditor">Patient Table Editor</Translate>
      </span>
    </NavLink>
  </NavItem>
);
