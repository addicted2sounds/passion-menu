import React from 'react';
import { Route, Redirect } from 'react-router-dom';
import ls from 'local-storage';

const ProtectedRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={(props) => (
    ls.get('token') ?
      <Component {...props} /> :
      <Redirect to={{ pathname: "/auth", state: { from: props.location }}}/>
  )} />
);

export default ProtectedRoute;
