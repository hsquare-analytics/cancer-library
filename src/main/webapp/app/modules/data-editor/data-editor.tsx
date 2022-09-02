import React from 'react';
import {useParams} from 'react-router-dom';

export const DataEditor = () => {
  const { categoryId } = useParams<'categoryId'>();

  return (
    <div>
      <h2 id="configuration-page-heading" data-cy="configurationPageHeading">
       Data Editor
      </h2>
      <p>
        category id: {categoryId}
      </p>
    </div>
  );
};

export default DataEditor;
