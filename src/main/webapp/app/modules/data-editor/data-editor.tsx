import React from 'react';
import {useParams} from 'react-router-dom';

export const DataEditor = () => {
  const { categoryTitle } = useParams<'categoryTitle'>();

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
       Data Editor
      </h2>
      <p>
        {categoryTitle}
      </p>
    </div>
  );
};

export default DataEditor;
