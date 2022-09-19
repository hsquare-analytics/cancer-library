import {IEntityForm} from "app/shared/model/devextreme-form.model";

const metaCategoryFormInfo : Array<IEntityForm> = [
  {
    itemType: 'group',
    colCount : 2,
    colSpan : 2,
    child : [
      {
        itemField : 'title',
        colSpan : 2,
        caption : 'title'
      },
      {
        itemField : 'description',
        colSpan : 2,
      },
      {
        itemField : 'activated',
        editorType : 'dxCheckBox',
      },
      {
        itemField : 'library.id',
        editorType : 'dxSelectBox',
        editorOptions : {
          displayExpr : 'title',
          valueExpr : "id",
        }
      }
    ]
  }
]

export default metaCategoryFormInfo;
