import React from 'react';
import {Translate} from 'react-jhipster';

import {NavItem, NavLink} from 'reactstrap';
import {NavLink as Link} from 'react-router-dom';
import patientGridIcon from '../../../asset/img/icon-patient.svg';

export const ReviewerStatisticsMenu = () => (
  <NavItem data-cy="reviewer-statistics-menu">
    <NavLink tag={Link} to="/reviewer-statistics" className="d-flex align-items-center">
      <img src={patientGridIcon} alt="리뷰어 통계" style={{ transform: 'scale(0.8) translateX(2px)' }} />
      <span>
        <Translate contentKey="global.menu.reviewer-statistics">Reviewer Statistcs</Translate>
      </span>
    </NavLink>
  </NavItem>
);
