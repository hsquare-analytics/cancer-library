import React, {useState} from 'react';
import {Translate, translate, ValidatedField} from 'react-jhipster';
import {Alert, Button, Col, Form, Row} from 'reactstrap';
import {useForm} from 'react-hook-form';

import Register from 'app/modules/account/register/register';
import PasswordResetInit from 'app/modules/account/password-reset/init/password-reset-init';

export interface ILoginModalProps {
  showModal: boolean;
  loginError: boolean;
  handleLogin: (username: string, password: string, rememberMe: boolean) => void;
  handleClose: () => void;
}

const LoginModal = (props: ILoginModalProps) => {
  const login = ({ username, password, rememberMe }) => {
    props.handleLogin(username, password, rememberMe);
  };

  const [showRegisterModal, setShowRegisterModal] = useState(false);
  const [showPasswordModal, setShowPasswordModal] = useState(false);

  const {
    handleSubmit,
    register,
    formState: { errors, touchedFields },
  } = useForm({ mode: 'onTouched' });

  const { loginError } = props;

  const handleLoginSubmit = e => {
    handleSubmit(login)(e);
  };

  return (
    <div className="box-login">
      <Form onSubmit={handleLoginSubmit}>
        <Row>
          <Col md="12">
            {loginError ? (
              <Alert color="danger" data-cy="loginError">
                <Translate contentKey="login.messages.error.authentication">
                  <strong>Failed to sign in!</strong> Please check your credentials and try again.
                </Translate>
              </Alert>
            ) : null}
          </Col>
          <Col md="12">
            <ValidatedField
              name="username"
              label={translate('global.form.username.label')}
              placeholder={translate('global.form.username.placeholder')}
              required
              data-cy="username"
              validate={{ required: 'ID cannot be empty!' }}
              register={register}
              error={errors.username}
              isTouched={touchedFields.username}
              className="box-login-field"
            />
            <ValidatedField
              name="password"
              type="password"
              label={translate('login.form.password')}
              placeholder={translate('login.form.password.placeholder')}
              required
              data-cy="password"
              validate={{ required: 'Password cannot be empty!' }}
              register={register}
              error={errors.password}
              isTouched={touchedFields.password}
              className="box-login-field"
            />
            <ValidatedField
              name="rememberMe"
              type="checkbox"
              check
              label={translate('login.form.rememberme')}
              value={true}
              register={register}
              className="box-login-field"
            />
          </Col>
        </Row>
        <div className="area-account">
          {/* <Link to="/account/register"> */}
          {/*   <Translate contentKey="global.messages.info.register.link">Register a new account</Translate> */}
          {/* </Link> */}

          {/* <Link to="/account/reset/request" data-cy="forgetYourPasswordSelector"> */}
          {/*   <Translate contentKey="login.password.forgot">Did you forget your password?</Translate> */}
          {/* </Link> */}

          <a href="#" onClick={() => setShowRegisterModal(prevState => !prevState)}>
            <Translate contentKey="global.messages.info.register.link">Register a new account</Translate>
          </a>

          <a href="#" onClick={() => setShowPasswordModal(prevState => !prevState)}>
            <Translate contentKey="login.password.forgot">Did you forget your password?</Translate>
          </a>
        </div>

        <div className="area-btn">
          <Button color="primary" type="submit" data-cy="submit" size="lg">
            <Translate contentKey="login.form.button">Sign in</Translate>
          </Button>
        </div>
      </Form>

      <Register showRegisterModal={showRegisterModal} setShowRegisterModal={setShowRegisterModal} />
      <PasswordResetInit showPasswordModal={showPasswordModal} setShowPasswordModal={setShowPasswordModal} />
    </div>
  );
};

export default LoginModal;
