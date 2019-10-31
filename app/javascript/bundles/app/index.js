import React from 'react';
import { BrowserRouter as Router, Switch, Route} from 'react-router-dom';

import ProtectedRoute from './components/ProtectedRoute';
import Auth from './components/Auth';
import VerticalsList from './components/VerticalsList';
import Home from './components/Home';
import CoursesList from './components/CoursesList';
import { setToken } from './axios';
import 'styles/app.scss'

export default ({ token }) => {
  setToken(token);
  return (
    <Router>
      <div className="header">Passion Menu</div>
      {token && <VerticalsList/>}
      <main>
        <Switch>
          <ProtectedRoute path="/" exact component={Home}/>
          <Route path="/auth" component={Auth}/>
          <ProtectedRoute path="/categories/:categoryId" component={CoursesList}/>
        </Switch>
      </main>
    </Router>
  )
}