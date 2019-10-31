import React, { useState, useEffect } from 'react';
import ls from 'local-storage';
import { Redirect } from 'react-router-dom';

import VerticalsList from './VerticalsList';
import { logout } from '../api';

export default () => {
  const [redirect, setRedirect] = useState(false);
  useEffect(() => {
    if (!ls.get('token')) setRedirect(true);
  })
  const handleClick = () => logout().then(
    () => {
      ls.remove('token');
      setRedirect(true);
    }
  );
  return redirect ? <Redirect to='/auth'/> : (
    <>
      <div className="header">
        <button className="right" onClick={handleClick}>Logout</button>
        Passion Menu
      </div>
      <VerticalsList/>
    </>
  )
}