import React from 'react';
import {NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import accountIcon from 'app/asset/img/icon-config.svg';
import {Translate} from 'react-jhipster';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';

const accountMenuItemsAuthenticated = () => (
  <>
    <NavLink tag={Link} icon="wrench" to="/account/settings" data-cy="settings">
      <Translate contentKey="global.menu.account.settings">Settings</Translate>
    </NavLink>
    <NavLink tag={Link} icon="lock" to="/account/password" data-cy="passwordItem">
      <Translate contentKey="global.menu.account.password">Password</Translate>
    </NavLink>
    <NavLink tag={Link} icon="sign-out-alt" to="/logout" data-cy="logout">
      <Translate contentKey="global.menu.account.logout">Sign out</Translate>
    </NavLink>
  </>
);

const accountMenuItems = () => (
  <>
    <NavLink tag={Link} id="login-item" icon="sign-in-alt" to="/login" data-cy="login">
      <Translate contentKey="global.menu.account.login">Sign in</Translate>
    </NavLink>
    <NavLink tag={Link} icon="user-plus" to="/account/register" data-cy="register">
      <Translate contentKey="global.menu.account.register">Register</Translate>
    </NavLink>
  </>
);

interface IAccountMenuProps {
  isAuthenticated?: boolean;
}

export const AccountMenu = ({isAuthenticated = false}: IAccountMenuProps) => {
  return (
    <div>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon/>}
          aria-controls="panel1a-content"
          id="panel1a-header"
        >
          <img src={accountIcon} alt="계정" style={{transform: 'scale(0.95) translateX(2px)'}}/>
          <span> <Translate contentKey="global.menu.account.main">account</Translate> </span>
        </AccordionSummary>
        <AccordionDetails>
          {isAuthenticated ? accountMenuItemsAuthenticated() : accountMenuItems()}
        </AccordionDetails>
      </Accordion>
    </div>
  )
}

export default AccountMenu;
