import * as React from 'react';
import LightModeOutlinedIcon from '@mui/icons-material/LightModeOutlined';
import DarkModeOutlinedIcon from '@mui/icons-material/DarkModeOutlined';
import {PaletteMode} from "@mui/material";

type ToggleProps = {
  mode: PaletteMode
  onToggleMode: (e: PaletteMode) => void
}

function ToggleTheme(props: ToggleProps) {
  const {mode, onToggleMode} = props

  return (
    <div className='area-theme-toggle' >
      {
        mode === 'light'
          ? <LightModeOutlinedIcon onClick={() => onToggleMode('dark')} />
          : <DarkModeOutlinedIcon onClick={() => onToggleMode('light')} />
      }
    </div>
  );
}

export default ToggleTheme;
