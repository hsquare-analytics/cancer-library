import library from 'app/entities/library/library.reducer';
import category from 'app/entities/category/category.reducer';
import item from 'app/entities/item/item.reducer';
import userCategory from 'app/entities/user-category/user-category.reducer';
/* jhipster-needle-add-reducer-import - JHipster will add reducer here */

const entitiesReducers = {
  library,
  category,
  item,
  userCategory
  /* jhipster-needle-add-reducer-combine - JHipster will add reducer here */
};

export default entitiesReducers;
