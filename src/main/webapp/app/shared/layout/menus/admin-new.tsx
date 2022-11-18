import React from 'react';
import { NavItem, NavLink } from 'reactstrap';
import { NavLink as Link } from 'react-router-dom';
import adminIcon from 'app/asset/img/icon-admin.svg';
import { Translate } from 'react-jhipster';

function AdminNew(props) {
  return (
    <NavItem id="user-patient-dnd-grid-menu">
      <NavLink tag={Link} to="/admin/subject" className="d-flex align-items-center">
        <img src={adminIcon} alt="관리자" style={{ transform: 'translateX(2px)' }} />
        <span>
          <Translate contentKey="global.menu.admin.main">Patient Table Editor</Translate>
        </span>
      </NavLink>
    </NavItem>
  );
}

export default AdminNew;
