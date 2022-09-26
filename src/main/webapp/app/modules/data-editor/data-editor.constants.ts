import {REVIEW_LIST} from "app/config/constants";
import {translate} from "react-jhipster";

export const REVIEW_COLUMN_LIST = [
  {id: 0, valueExpr: '', displayExpr: "-"},
  {id: 1, valueExpr: REVIEW_LIST.SUBMITTED, displayExpr: translate('datasource.review.submitted')},
  {id: 2, valueExpr: REVIEW_LIST.DECLINED, displayExpr: translate('datasource.review.declined')},
  {id: 2, valueExpr: REVIEW_LIST.APPROVED, displayExpr: translate('datasource.review.approved')},
];
