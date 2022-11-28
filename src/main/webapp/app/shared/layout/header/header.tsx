import './header.scss';

import React, {useState} from 'react';
import {Storage} from 'react-jhipster';
import {Collapse, Nav, Navbar, NavbarToggler} from 'reactstrap';
import LoadingBar from 'react-redux-loading-bar';

import {Brand, Home} from './header-components';
import {DatasourceEditorMenu, UserPatientDndGridMenu} from '../menus';
import {useAppDispatch} from 'app/config/store';
import {setLocale} from 'app/shared/reducers/locale';
import Admin from 'app/shared/layout/menus/admin';
import SideLogoutButton from 'app/shared/layout/header/side-logout-button';
import Account from 'app/shared/layout/menus/account';
import {createTheme, ThemeProvider} from '@mui/material/styles';

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

const customTheme = createTheme({
  components: {
    MuiAccordion: {
      styleOverrides: {
        root: ({theme}) => ({
          backgroundColor: theme.sidebar?.backgroundColor,
        }),
      },
    },
  },
});

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
      <ThemeProvider theme={customTheme}>
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
                    {/* <LocaleMenu currentLocale={props.currentLocale} onClick={handleLocaleChange} /> */}
                    <Admin showOpenAPI={props.isOpenAPIEnabled} showDatabase={!props.isInProduction} />
                  </>
                )}
                <Account isAuthenticated={props.isAuthenticated} />
              </Nav>
            </Collapse>

            {props.children}

            <SideLogoutButton />

            <BrandIcon />
          </Navbar>
        ) : null}
      </ThemeProvider>
    </div>
  );
};

export default Header;
