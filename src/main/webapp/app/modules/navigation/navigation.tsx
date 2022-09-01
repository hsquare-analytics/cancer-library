import React, {useEffect} from 'react';

import {useAppDispatch, useAppSelector} from 'app/config/store';
import {getCategories} from 'app/modules/navigation/navigation.reducer';

export const Navigation = () => {
  const dispatch = useAppDispatch();

  const categoryList = useAppSelector(state => state.navigation.categories);

  const initStore = () => {
    dispatch(getCategories());
  };

  useEffect(() => {
    initStore();
  }, []);

  return (
    <div className="navigation-container">
      {categoryList.length !== 0 ? categoryList.map(category => {
        return <div key={category}>{category.title}</div>
      }) : "empty category"}
    </div>
  );

};

export default Navigation;
