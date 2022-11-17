import React from 'react';
import {Translate} from 'react-jhipster';

import {NavbarBrand, NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

export const Brand = () => (
  <NavbarBrand tag={Link} to="/" className="brand-logo d-flex flex-column">
    <span className="brand-title">
      <Translate contentKey="global.title">Cancer Library App</Translate>
    </span>
  </NavbarBrand>
);

export const Home = () => (
  <NavItem>
    <NavLink tag={Link} to="/" className="d-flex align-items-center">
      <FontAwesomeIcon icon="home"/>
      <span>
        <Translate contentKey="global.menu.home">Home</Translate>
      </span>
    </NavLink>
  </NavItem>
);
