import './header.scss';

import React, {useState} from 'react';
import {Storage, Translate} from 'react-jhipster';
import {Collapse, Nav, Navbar, NavbarToggler} from 'reactstrap';
import LoadingBar from 'react-redux-loading-bar';

import {Brand, Home} from './header-components';
import {AccountMenu, AdminMenu, DatasourceEditorMenu, LocaleMenu, UserPatientDndGridMenu} from '../menus';
import {useAppDispatch} from 'app/config/store';
import {setLocale} from 'app/shared/reducers/locale';

export interface IHeaderProps {
  isAuthenticated: boolean;
  isAdmin: boolean;
  isSupervisor: boolean;
  ribbonEnv: string;
  isInProduction: boolean;
  isOpenAPIEnabled: boolean;
  currentLocale: string;
}

const Header = (props: IHeaderProps) => {
  const [menuOpen, setMenuOpen] = useState(false);

  const dispatch = useAppDispatch();

  const handleLocaleChange = event => {
    const langKey = event.target.value;
    Storage.session.set('locale', langKey);
    dispatch(setLocale(langKey));
  };

  const renderDevRibbon = () =>
    props.isInProduction === false ? (
      <div className="ribbon dev">
        <a href="">
          <Translate contentKey={`global.ribbon.${props.ribbonEnv}`}/>
        </a>
      </div>
    ) : null;

  const toggleMenu = () => setMenuOpen(!menuOpen);

  /* jhipster-needle-add-element-to-menu - JHipster will add new menu items here */

  return (
    <div id="app-header">
      {renderDevRibbon()}
      <LoadingBar className="loading-bar"/>
      <Navbar data-cy="navbar" dark expand="md" fixed="left" className="jh-navbar">
        <NavbarToggler aria-label="Menu" onClick={toggleMenu}/>
        <Brand/>
        <Collapse isOpen={menuOpen} navbar>
          <Nav id="header-tabs" className="ms-auto flex-column" navbar>
            <Home/>
            {props.isAuthenticated && <DatasourceEditorMenu/>}
            {props.isAuthenticated && (props.isSupervisor || props.isAdmin) && <UserPatientDndGridMenu/>}
            {props.isAuthenticated && props.isAdmin && (
              <>
                <AdminMenu showOpenAPI={props.isOpenAPIEnabled} showDatabase={!props.isInProduction}/>
                <LocaleMenu currentLocale={props.currentLocale} onClick={handleLocaleChange}/>
              </>
            )}
            <AccountMenu isAuthenticated={props.isAuthenticated}/>
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  );
};

export default Header;
