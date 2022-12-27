import {translate} from 'react-jhipster';
import {ICategory} from "app/shared/model/category.model";
import _ from "lodash";
import Swal from "sweetalert2";


export const onRowValidating = (e, data: { category: ICategory, itemContainer: any }, callback: (value: string[]) => void) => {
  const {category, itemContainer} = data;
  const items = itemContainer[category.id];
  const targetData = {...e.oldData, ...e.newData};
  const validationFailedItemList = [];

  const isDxCellNil = (value: any): boolean => {
    return _.isNil(value) || value === 'null' || value === '';
  }

  items.forEach(item => {
    if (!item || !item.attribute) {
      return false;
    }
    if (item.attribute.required && isDxCellNil(targetData[item.title.toLowerCase()])) {
      const singleMessage = translate('cancerLibraryApp.singleTableEditor.validator.required', {field: item.attribute.caption || item.title});

      validationFailedItemList.push({...item, message: singleMessage});
      e.isValid = false;
      return false;
    }
  });

  if (validationFailedItemList.length > 0) {
    callback(validationFailedItemList);
    const concatenatedMessage = translate('cancerLibraryApp.singleTableEditor.validator.required', {field: validationFailedItemList.map(item => item.property?.caption || item.title).join(', ')});
    // e.errorText = concatenatedMessage;
    Swal.fire({
      icon: 'error',
      text: concatenatedMessage,
    });
  }
}

