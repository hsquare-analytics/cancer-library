import {PaletteMode} from "@mui/material";

// @mui 의 컴포넌트를 사용하는 경우 테마에 따른 컬러를 설정해줘야 함
// @mui 가 아닌 케이스는 css variables 에 따른다
export const getDesignTokens = (mode: PaletteMode) => ({
  sidebar: {
    default: '#455364'
  },
  palette: {
    mode,
    ...(mode === 'light'
      ? {
        // palette values for light mode
        background: {
          default: '#fff'
        },
        primary: {
          main: '#4285F4',
          contrastText: '#fff',
        },
        secondary: {
          main: '#545454',
          contrastText: '#fff',
        },
      }
      : {
        // palette values for dark mode
        background: {
          default: '#333'
        },
        primary: {
          main: '#4285F4',
          contrastText: '#fff',
        },
        secondary: {
          main: '#545454',
          contrastText: '#fff',
        },
      }),
  },
});
