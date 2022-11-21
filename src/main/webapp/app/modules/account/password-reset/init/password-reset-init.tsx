import React, { useEffect } from 'react';
import { Translate, translate, ValidatedField, ValidatedForm, isEmail } from 'react-jhipster';
import { Button, Modal, ModalHeader, ModalBody, ModalFooter, Row, Col, Alert } from 'reactstrap';
import { toast } from 'react-toastify';

import { handlePasswordResetInit, reset } from '../password-reset.reducer';
import { useAppDispatch, useAppSelector } from 'app/config/store';

export const PasswordResetInit = props => {
  const { showPasswordModal, setShowPasswordModal } = props;

  const dispatch = useAppDispatch();

  useEffect(
    () => () => {
      dispatch(reset());
    },
    []
  );

  const handleValidSubmit = ({ email }) => {
    dispatch(handlePasswordResetInit(email));
  };

  const successMessage = useAppSelector(state => state.passwordReset.successMessage);

  useEffect(() => {
    if (successMessage) {
      toast.success(translate(successMessage));
    }
  }, [successMessage]);

  return (
    <Modal
      isOpen={showPasswordModal}
      toggle={() => setShowPasswordModal(false)}
      id="register-page"
      autoFocus={false}
      className="wrap-register-modal"
    >
      <Row className="justify-content-center">
        <Col>
          <ModalHeader id="register-title" data-cy="registerTitle" toggle={() => setShowPasswordModal(false)}>
            <Translate contentKey="reset.request.title">Reset your password</Translate>
          </ModalHeader>

          <ValidatedForm onSubmit={handleValidSubmit}>
            <ModalBody>
              <Alert color="secondary">
                <p>
                  <Translate contentKey="reset.request.messages.info">Enter the email address you used to register</Translate>
                </p>
              </Alert>
              <ValidatedField
                name="email"
                label={translate('global.form.email.label')}
                placeholder={translate('global.form.email.placeholder')}
                type="email"
                validate={{
                  required: { value: true, message: translate('global.messages.validate.email.required') },
                  minLength: { value: 5, message: translate('global.messages.validate.email.minlength') },
                  maxLength: { value: 254, message: translate('global.messages.validate.email.maxlength') },
                  validate: v => isEmail(v) || translate('global.messages.validate.email.invalid'),
                }}
                data-cy="emailResetPassword"
              />
              <Button color="primary" type="submit" data-cy="submit">
                <Translate contentKey="reset.request.form.ok">ok</Translate>
              </Button>
            </ModalBody>
          </ValidatedForm>
        </Col>
      </Row>
    </Modal>
  );
};

export default PasswordResetInit;
