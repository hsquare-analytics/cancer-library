import './home.scss';

import React from 'react';
import {Link} from 'react-router-dom';
import {Translate} from 'react-jhipster';

import {useAppSelector} from 'app/config/store';
import Login from "app/modules/login/login";

export const Home = () => {
  const account = useAppSelector(state => state.authentication.account);

  return (
    <div className='wrap-home'>
      {
        account?.login
          ? (
            <div className='area-home-title'>
              <h1>
                <p>
                  <Translate contentKey="home.logged.message" interpolate={{username: account.login}}>
                    {/* 님 안녕하세요 */}
                  </Translate>
                </p>
                <p>
                  <Translate contentKey="home.title">
                    {/* SNUH의 암 라이브러리 어플리케이션 입니다. */}
                  </Translate>
                </p>
              </h1>

            </div>
          )
          : (
            <div className='area-login'>
              <h1>
                <Translate contentKey="home.title">
                  {/* SNUH의 암 라이브러리 어플리케이션 입니다. */}
                </Translate>
              </h1>
              <p>권한을 할당받은 테이블을 선택하고 편집할 수 있습니다.</p>

              <Login />

            </div>
          )
      }
    </div>
  )

  // return (
  //   <Row>
  //     <Col md="3" className="pad">
  //       <span className="hipster rounded" />
  //     </Col>
  //     <Col md="9">
  //       <h2>
  //         <Translate contentKey="home.title">Welcome, Java Hipster!</Translate>
  //       </h2>
  //       <p className="lead">
  //         <Translate contentKey="home.subtitle">This is your homepage</Translate>
  //       </p>
  //       {account?.login ? (
  //         <div>
  //           <Alert color="success">
  //             <Translate contentKey="home.logged.message" interpolate={{ username: account.login }}>
  //               You are logged in as user {account.login}.
  //             </Translate>
  //           </Alert>
  //         </div>
  //       ) : (
  //         <div>
  //           <Alert color="warning">
  //             <Translate contentKey="global.messages.info.authenticated.prefix">If you want to </Translate>
  //
  //             <Link to="/login" className="alert-link">
  //               <Translate contentKey="global.messages.info.authenticated.link"> sign in</Translate>
  //             </Link>
  //             <Translate contentKey="global.messages.info.authenticated.suffix">
  //               , you can try the default accounts:
  //               <br />- Administrator (login=&quot;admin&quot; and password=&quot;admin&quot;)
  //               <br />- Supervisor (login=&quot;supervisor&quot; and password=&quot;supervisor&quot;)
  //               <br />- Reviewer1 (login=&quot;reviewer1&quot; and password=&quot;reviewer&quot;).
  //               <br />- Reviewer2 (login=&quot;reviewer2&quot; and password=&quot;reviewer&quot;).
  //               <br />- Reviewer3 (login=&quot;reviewer3&quot; and password=&quot;reviewer&quot;).
  //             </Translate>
  //           </Alert>
  //
  //           <Alert color="warning">
  //             <Translate contentKey="global.messages.info.register.noaccount">You do not have an account yet?</Translate>&nbsp;
  //             <Link to="/account/register" className="alert-link">
  //               <Translate contentKey="global.messages.info.register.link">Register a new account</Translate>
  //             </Link>
  //           </Alert>
  //         </div>
  //       )}
  //     </Col>
  //   </Row>
  // );
};

export default Home;
