import {translate} from 'react-jhipster';
import {toast} from 'react-toastify';
import {ICategory} from "app/shared/model/category.model";
import _ from "lodash";
import Swal from "sweetalert2";


export enum ActionType {
  CREATE = 'create',
  UPDATE = 'update',
  DELETE = 'delete'
}

export const toastApiResult = (type: ActionType, data: { table: string, row?: string }) => {
  switch (type) {
    case ActionType.CREATE:
      toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.createSuccess', data));
      break;
    case ActionType.UPDATE:
      toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.updateSuccess', data));
      break;
    case ActionType.DELETE:
      toast.info(translate('cancerLibraryApp.datasource.singleTableEditor.deleteSuccess', data));
      break;
    default:
      break;
  }
}


export const onRowValidating = (e, data: { category: ICategory, itemContainer: any }, callback: (value: string[]) => void) => {
  const {category, itemContainer} = data;
  const items = itemContainer[category.id];
  const targetData = {...e.oldData, ...e.newData};
  const validationFailedItemList = [];
  items.forEach(item => {
    if (!item || !item.property) {
      return false;
    }
    if (item.property.required && (_.isEmpty(targetData[item.title.toLowerCase()]) || targetData[item.title.toLowerCase()] === 'null')) {
      const singleMessage = translate('cancerLibraryApp.datasource.singleTableEditor.validator.required', {field: item.property.caption || item.title});

      validationFailedItemList.push({...item, message: singleMessage});
      e.isValid = false;
      return false;
    }
  });

  if (validationFailedItemList.length > 0) {
    callback(validationFailedItemList);
    const concatenatedMessage = translate('cancerLibraryApp.datasource.singleTableEditor.validator.required', {field: validationFailedItemList.map(item => item.property?.caption || item.title).join(', ')});
    // e.errorText = concatenatedMessage;
    Swal.fire({
      icon: 'error',
      text: concatenatedMessage,
    });
  }
}

export const makeCallBackOnPromise = (e, callback: () => void) => {
  e.promise = new Promise<void>((resolve) => {
    callback();
    resolve();
  });
}
