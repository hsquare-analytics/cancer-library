import React from 'react';
import { Translate, translate, ValidatedField } from 'react-jhipster';
import { Button, Alert, Row, Col, Form } from 'reactstrap';
import { Link } from 'react-router-dom';
import { useForm } from 'react-hook-form';

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

  const {
    handleSubmit,
    register,
    formState: { errors, touchedFields },
  } = useForm({ mode: 'onTouched' });

  const { loginError, handleClose } = props;

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
          <Link to="/account/register">
            <Translate contentKey="global.messages.info.register.link">Register a new account</Translate>
          </Link>

          <Link to="/account/reset/request" data-cy="forgetYourPasswordSelector">
            <Translate contentKey="login.password.forgot">Did you forget your password?</Translate>
          </Link>
        </div>

        <div className="area-btn">
          <Button color="primary" type="submit" data-cy="submit" size="lg">
            <Translate contentKey="login.form.button">Sign in</Translate>
          </Button>
        </div>
      </Form>
    </div>
  );
};

export default LoginModal;
