import React from 'react';
import {Translate} from 'react-jhipster';

import MenuItem from 'app/shared/layout/menus/menu-item';

const EntitiesMenu = () => {
  return (
    <>
      <MenuItem icon="asterisk" to="/subject">
        <Translate contentKey="global.menu.entities.subject" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/library">
        <Translate contentKey="global.menu.entities.library" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/category">
        <Translate contentKey="global.menu.entities.category" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/item">
        <Translate contentKey="global.menu.entities.item" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/user-category">
        <Translate contentKey="global.menu.entities.user-category" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/user-patient">
        <Translate contentKey="global.menu.entities.user-patient" />
      </MenuItem>
      <MenuItem icon="asterisk" to="/codebook">
        <Translate contentKey="global.menu.entities.codebook" />
      </MenuItem>
    </>
  );
};

export default EntitiesMenu;
