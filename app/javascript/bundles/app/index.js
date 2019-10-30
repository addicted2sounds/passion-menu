import React from 'react';
import { BrowserRouter as Router, Switch, Route} from 'react-router-dom';

import VerticalsList from './components/VerticalsList';
import Home from './components/Home';
import CoursesList from './components/CoursesList';
import 'styles/app.scss'

export default () => {
  return (
    <Router>
      <div className="header">Passion Menu</div>
      <VerticalsList/>
      <main>
        <Switch>
          <Route path="/" exact component={Home}/>
          <Route path="/categories/:categoryId" component={CoursesList}/>
        </Switch>
      </main>
    </Router>
  )
}