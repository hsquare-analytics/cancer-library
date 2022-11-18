import React from 'react';
import {render} from '@testing-library/react';
import {Provider} from 'react-redux';
import {MemoryRouter} from 'react-router-dom';

import initStore from 'app/config/store';
import Header from './header';

describe('Header', () => {
  let mountedWrapper;
  const devProps = {
    isAuthenticated: true,
    hasSuAuthority: true,
    isAdmin: true,
    currentLocale: 'en',
    ribbonEnv: 'dev',
    isInProduction: false,
    isOpenAPIEnabled: true,
    children: <div>children</div>,
  };
  const prodProps = {
    ...devProps,
    ribbonEnv: 'prod',
    isInProduction: true,
    isOpenAPIEnabled: false,
  };
  const supervisorProps = {
    ...prodProps,
    hasSuAuthority: true,
    isAdmin: false,
  }
  const userProps = {
    ...prodProps,
    hasSuAuthority: false,
    isAdmin: false,
  };
  const guestProps = {
    ...prodProps,
    hasSuAuthority: false,
    isAdmin: false,
    isAuthenticated: false,
  };

  const wrapper = (props = devProps) => {
    if (!mountedWrapper) {
      const store = initStore();
      const { container } = render(
        <Provider store={store}>
          <MemoryRouter>
            <Header {...props} />
          </MemoryRouter>
        </Provider>
      );
      mountedWrapper = container.innerHTML;
    }
    return mountedWrapper;
  };

  beforeEach(() => {
    mountedWrapper = undefined;
  });

  // All tests will go here
  it('Renders a Header component in dev profile with LoadingBar, Navbar, Nav and dev ribbon.', () => {
    const html = wrapper();

    // Find Navbar component
    expect(html).toContain('navbar');
    // Find AdminMenu component
    expect(html).not.toContain('admin-menu');
    // Find AccountMenu component
    expect(html).not.toContain('account-menu');
    // Ribbon
    // expect(html).toContain('ribbon');
  });

  it('Renders a Header component in prod profile with LoadingBar, Navbar, Nav.', () => {
    const html = wrapper(prodProps);

    // Find Navbar component
    expect(html).toContain('navbar');
    // Find AdminMenu component
    expect(html).not.toContain('admin-menu');
    // Find AccountMenu component
    expect(html).not.toContain('account-menu');
    // No Ribbon
    expect(html).not.toContain('ribbon');
  });

  it('Renders a Header component in prod profile with logged in Supervisor', () => {
    const html = wrapper(supervisorProps);

    // Find Navbar component
    expect(html).toContain('navbar');
    // Not find AdminMenu component
    expect(html).not.toContain('admin-menu');
    // Find AccountMenu component
    expect(html).not.toContain('account-menu');

    // Custom header
    expect(html).toContain('datasource-editor-menu');
    expect(html).toContain('user-patient-dnd-grid-menu');
  });

  it('Renders a Header component in prod profile with logged in User', () => {
    const html = wrapper(userProps);

    // Find Navbar component
    expect(html).toContain('navbar');
    // Not find AdminMenu component
    expect(html).not.toContain('admin-menu');
    // Find AccountMenu component
    expect(html).not.toContain('account-menu');

    // Custom header
    expect(html).toContain('datasource-editor-menu');
    expect(html).not.toContain('user-patient-dnd-grid-menu');
  });

  it('Renders a Header component in prod profile with no logged in User', () => {
    const html = wrapper(guestProps);

    // Find Navbar component
    expect(html).not.toContain('navbar');
    // Not find AdminMenu component
    expect(html).not.toContain('admin-menu');
    // Find AccountMenu component

    // Custom header
    expect(html).not.toContain('account-menu');
    expect(html).not.toContain('datasource-editor-menu');
  });
});
