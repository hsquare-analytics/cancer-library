import React, {useEffect, useState} from 'react';
import {useLocation, useNavigate, useParams} from 'react-router-dom';
import {Button, Modal, ModalBody, ModalFooter, ModalHeader} from 'reactstrap';
import {Translate} from 'react-jhipster';
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

import {useAppDispatch, useAppSelector} from 'app/config/store';
import {deleteEntity, getEntity} from './user-category.reducer';

export const UserCategoryDeleteDialog = () => {
  const dispatch = useAppDispatch();

  const location = useLocation();
  const navigate = useNavigate();
  const { id } = useParams<'id'>();

  const [loadModal, setLoadModal] = useState(false);

  useEffect(() => {
    dispatch(getEntity(id));
    setLoadModal(true);
  }, []);

  const userCategoryEntity = useAppSelector(state => state.userCategory.entity);
  const updateSuccess = useAppSelector(state => state.userCategory.updateSuccess);

  const handleClose = () => {
    navigate('/admin/user-category');
  };

  useEffect(() => {
    if (updateSuccess && loadModal) {
      handleClose();
      setLoadModal(false);
    }
  }, [updateSuccess]);

  const confirmDelete = () => {
    dispatch(deleteEntity(userCategoryEntity.id));
  };

  return (
    <Modal isOpen toggle={handleClose}>
      <ModalHeader toggle={handleClose} data-cy="userCategoryDeleteDialogHeading">
        <Translate contentKey="entity.delete.title">Confirm delete operation</Translate>
      </ModalHeader>
      <ModalBody id="cancerLibraryApp.userCategory.delete.question">
        <Translate contentKey="cancerLibraryApp.userCategory.delete.question" interpolate={{ id: userCategoryEntity.id }}>
          Are you sure you want to delete this User Category?
        </Translate>
      </ModalBody>
      <ModalFooter>
        <Button color="secondary" onClick={handleClose}>
          <FontAwesomeIcon icon="ban" />
          &nbsp;
          <Translate contentKey="entity.action.cancel">Cancel</Translate>
        </Button>
        <Button id="ph-confirm-delete-category" data-cy="entityConfirmDeleteButton" color="danger" onClick={confirmDelete}>
          <FontAwesomeIcon icon="trash" />
          &nbsp;
          <Translate contentKey="entity.action.delete">Delete</Translate>
        </Button>
      </ModalFooter>
    </Modal>
  );
};

export default UserCategoryDeleteDialog;
