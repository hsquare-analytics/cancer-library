import {translate} from 'react-jhipster';
import {toast} from 'react-toastify';


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
