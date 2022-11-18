import React from 'react';
import LogoutOutlinedIcon from '@mui/icons-material/LogoutOutlined';
import { useNavigate } from 'react-router-dom';

function SideLogoutButton() {
  const navigate = useNavigate();

  return (
    <div className="area-logout-button" onClick={() => navigate('/logout')}>
      <LogoutOutlinedIcon />
    </div>
  );
}

export default SideLogoutButton;
