import React from 'react';
import {render} from '@testing-library/react';
import {Provider} from 'react-redux';
import {MemoryRouter} from 'react-router-dom';
import configureStore from 'redux-mock-store';
import thunk from 'redux-thunk';
import AccessiblePatient from './accessible-patient';

describe('AccessiblePatient', () => {
  let mountedWrapper;

  const mockStore = configureStore([thunk]);

  const essentialState = {
    authentication: {
      account: {
        authorities: ['ROLE_USER']
      }
    },
    datasourcePatient: {
      entity: {},
      entities: [],
      loading: false,
    },
    datasourceContainer: {
      loading: false,
      categories: [],
      rawData: {
        container: [],
        count: 0,
      },
      item: {
        container: [],
        count: 0,
      }
    },
    datasourceStatus: {
      dateRange: {
        startDate: new Date(),
        endDate: new Date(),
      }
    }
  };

  const wrapper = (fakeState) => {
    if (!mountedWrapper) {
      const store = mockStore(fakeState);
      const {container} = render(
        <Provider store={store}>
          <MemoryRouter>
            <AccessiblePatient/>
          </MemoryRouter>
        </Provider>
      );
      mountedWrapper = container.innerHTML;
    }
    return mountedWrapper;
  }

  beforeEach(() => {
    mountedWrapper = undefined;
  });

  it('should render', () => {
    const html = wrapper(essentialState);

    expect(html).toContain('accessible-patient-datagrid');
  });
});

