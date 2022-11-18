import './header.scss';

import React, { useState } from 'react';
import { Storage, Translate } from 'react-jhipster';
import { Collapse, Nav, Navbar, NavbarToggler } from 'reactstrap';
import LoadingBar from 'react-redux-loading-bar';

import { Brand, Home } from './header-components';
import { AccountMenu, AdminMenu, DatasourceEditorMenu, LocaleMenu, UserPatientDndGridMenu } from '../menus';
import { useAppDispatch } from 'app/config/store';
import { setLocale } from 'app/shared/reducers/locale';
import AdminNew from 'app/shared/layout/menus/admin-new';
import SideLogoutButton from 'app/shared/layout/header/side-logout-button';
import AccountNew from 'app/shared/layout/menus/account-new';

export interface IHeaderProps {
  isAuthenticated: boolean;
  isAdmin: boolean;
  hasSuAuthority: boolean;
  ribbonEnv: string;
  isInProduction: boolean;
  isOpenAPIEnabled: boolean;
  currentLocale: string;
  children: JSX.Element;
}

export const BrandIcon = props => (
  <div {...props} className="brand-icon">
    <img src="content/images/logo-planit-healthcare.png" alt="Logo" />
  </div>
);

const Header = (props: IHeaderProps) => {
  const [menuOpen, setMenuOpen] = useState(false);

  const dispatch = useAppDispatch();

  const handleLocaleChange = event => {
    const langKey = event.target.value;
    Storage.session.set('locale', langKey);
    dispatch(setLocale(langKey));
  };

  const toggleMenu = () => setMenuOpen(!menuOpen);

  /* jhipster-needle-add-element-to-menu - JHipster will add new menu items here */

  return (
    <div id="app-header">
      <LoadingBar className="loading-bar" />

      {props.isAuthenticated ? (
        <Navbar data-cy="navbar" dark expand="md" fixed="left" className="app-navbar">
          <NavbarToggler aria-label="Menu" onClick={toggleMenu} />
          <Brand />
          <Collapse isOpen={menuOpen} navbar>
            <Nav id="header-tabs" className="flex-column" navbar>
              <Home />
              {props.isAuthenticated && <DatasourceEditorMenu />}
              {props.isAuthenticated && props.hasSuAuthority && <UserPatientDndGridMenu />}
              {props.isAuthenticated && props.isAdmin && (
                <>
                  {/* <AdminMenu showOpenAPI={props.isOpenAPIEnabled} showDatabase={!props.isInProduction} /> */}
                  {/* <LocaleMenu currentLocale={props.currentLocale} onClick={handleLocaleChange} /> */}
                  <AdminNew />
                </>
              )}
              {/* <AccountMenu isAuthenticated={props.isAuthenticated} /> */}
              <AccountNew />
            </Nav>
          </Collapse>

          {props.children}

          <SideLogoutButton />

          <BrandIcon />
        </Navbar>
      ) : null}
    </div>
  );
};

export default Header;
