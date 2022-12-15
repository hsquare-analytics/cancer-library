import category from 'app/entities/category/category.reducer';
import item from 'app/entities/item/item.reducer';
import subject from 'app/entities/subject/subject.reducer';
import topic from 'app/entities/topic/topic.reducer';
import group from 'app/entities/group/group.reducer';
import userCategory from 'app/entities/user-category/user-category.reducer';
import userPatient from 'app/entities/user-patient/user-patient.reducer';
import codebook from 'app/entities/codebook/codebook.reducer';
import comment from 'app/entities/comment/comment.reducer';
/* jhipster-needle-add-reducer-import - JHipster will add reducer here */

const entitiesReducers = {
  item,
  userCategory,
  subject,
  topic,
  category,
  group,
  userPatient,
  codebook,
  comment
  /* jhipster-needle-add-reducer-combine - JHipster will add reducer here */
};

export default entitiesReducers;
