import React from 'react';
import {NavLink} from 'reactstrap';
import {Translate} from 'react-jhipster';
import Accordion from '@mui/material/Accordion';
import AccordionSummary from '@mui/material/AccordionSummary';
import AccordionDetails from '@mui/material/AccordionDetails';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import {NavLink as Link} from 'react-router-dom';
import accountIcon from 'app/asset/img/icon-config.svg';

const AdminMenuItems = () => (
  <>
    <NavLink tag={Link} icon="database" to="/admin/subject">
      <Translate contentKey="global.menu.admin.subject">Subject management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="database" to="/admin/topic">
      <Translate contentKey="global.menu.admin.topic">Topic management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="table" to="/admin/category">
      <Translate contentKey="global.menu.admin.category">Category management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="table" to="/admin/group">
      <Translate contentKey="global.menu.admin.group">Group management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="table" to="/admin/item">
      <Translate contentKey="global.menu.admin.item">Item management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="users" to="/admin/user-management">
      <Translate contentKey="global.menu.admin.userManagement">User management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="users" to="/admin/user-patient">
      <Translate contentKey="global.menu.admin.user-patient">User Category management</Translate>
    </NavLink>
    <NavLink tag={Link} icon="table" to="/admin/codebook">
      <Translate contentKey="global.menu.admin.codebook">Code Book</Translate>
    </NavLink>
    <NavLink tag={Link} icon="table" to="/admin/comment">
      <Translate contentKey="global.menu.admin.comment">Code Book</Translate>
    </NavLink>
    <NavLink tag={Link} icon="eye" to="/admin/tracker">
      <Translate contentKey="global.menu.admin.tracker">User tracker</Translate>
    </NavLink>
    <NavLink tag={Link} icon="tachometer-alt" to="/admin/metrics">
      <Translate contentKey="global.menu.admin.metrics">Metrics</Translate>
    </NavLink>
    <NavLink tag={Link} icon="heart" to="/admin/health">
      <Translate contentKey="global.menu.admin.health">Health</Translate>
    </NavLink>
    <NavLink tag={Link} icon="cogs" to="/admin/configuration">
      <Translate contentKey="global.menu.admin.configuration">Configuration</Translate>
    </NavLink>
    <NavLink tag={Link} icon="tasks" to="/admin/logs">
      <Translate contentKey="global.menu.admin.logs">Logs</Translate>
    </NavLink>
  </>
);

const openAPIItem = () => (
  <NavLink tag={Link} icon="book" to="/admin/docs">
    <Translate contentKey="global.menu.admin.apidocs">API</Translate>
  </NavLink>
);

const databaseItem = () => (
  <NavLink tag="a" href="./h2-console/" target="_tab">
    <Translate contentKey="global.menu.admin.database">Database</Translate>
  </NavLink>
);

interface IAdminMenuProps {
  showOpenAPI: boolean;
  showDatabase: boolean;
}

function AdminMenu(props: IAdminMenuProps) {
  const {showOpenAPI = false, showDatabase = false} = props;
  return (
    <div>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon sx={{color: 'primary.contrastText'}} />}
          aria-controls="panel1a-content"
          id="panel1a-header"
        >
          <NavLink>
            <img src={accountIcon} alt="계정" style={{transform: 'scale(0.95) translateX(2px)'}} />
            <Translate contentKey="global.menu.admin.main">Administration</Translate>{' '}
          </NavLink>
        </AccordionSummary>
        <AccordionDetails>
          {AdminMenuItems()}
          {showOpenAPI && openAPIItem()}
          {showDatabase && databaseItem()}
        </AccordionDetails>
      </Accordion>
    </div>
  );
}

export default AdminMenu;
