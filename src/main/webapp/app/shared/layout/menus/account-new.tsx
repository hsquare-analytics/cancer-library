import React from 'react';
import {NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import accountIcon from 'app/asset/img/icon-config.svg';
import {Translate} from 'react-jhipster';

function AccountNew(props) {
  return (
    <NavItem data-cy="account-new-menu">
      <NavLink tag={Link} to="/account/settings" className="d-flex align-items-center">
        <img src={accountIcon} alt="계정" style={{ transform: 'translateX(2px)' }} />
        <span>
          <Translate contentKey="global.menu.account.main">account</Translate>
        </span>
      </NavLink>
    </NavItem>
  );
}

export default AccountNew;
