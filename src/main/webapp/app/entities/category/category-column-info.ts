import {IEntityColumn} from 'app/shared/model/devextreme-column.model'

const metaCategoryColumnInfo : Array<IEntityColumn> = [
  {
    dataField : 'id',
    caption : 'id',
    dataType : 'string',
    visible : true,
    width: 100,
    format : '',
    value : '',
    translate : 'cancerLibraryApp.category.id',
    alignment : 'left',
  },
  {
    dataField : 'title',
    caption : 'title',
    dataType : 'string',
    visible : true,
    format : '',
    value : '',
    translate : 'cancerLibraryApp.category.title',
    alignment : 'center',
  },
  {
    dataField : 'description',
    caption : 'description',
    dataType : 'string',
    visible : true,
    format : '',
    value : '',
    translate : 'cancerLibraryApp.category.description',
    alignment : 'center',
  },
  {
    dataField : 'activated',
    caption : 'activated',
    dataType : 'boolean',
    visible : true,
    format : '',
    value : '',
    translate : 'cancerLibraryApp.category.activated',
    alignment : 'center',
  },
  {
    caption : 'library',
    alignment: 'center',
    child : [
      {
        dataField : 'library.id',
        caption : 'id',
        width : 100,
        dataType : 'string',
        visible : false,
        format : '',
        value : '',
        translate : 'cancerLibraryApp.library.id',
        alignment : 'left',
      },
      {
        dataField : 'library.title',
        caption : 'title',
        dataType : 'string',
        visible : true,
        format : '',
        value : '',
        translate : 'cancerLibraryApp.library.title',
        alignment : 'center',
      },
      {
        dataField : 'library.description',
        caption : 'description',
        dataType : 'string',
        visible : true,
        format : '',
        value : '',
        translate : 'cancerLibraryApp.library.description',
        alignment : 'center',
      }
    ]
  }
]

export default metaCategoryColumnInfo;
