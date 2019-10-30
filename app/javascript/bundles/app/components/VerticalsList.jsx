import React, { useState, useEffect } from 'react';
import { fetchVerticals } from '../api';

import VerticalItem from './VerticalItem';

export default () => {
  const [verticals, setVerticals] = useState([]);

  useEffect(() => {
    fetchVerticals().then((response) => {
      setVerticals(response.data.data);
    });
  }, []);

  return (
    <ul className="verticals">
      {verticals.map(vertical => (
        <li key={vertical.id}>
          <VerticalItem vertical={vertical}/>
        </li>
      ))}
    </ul>
  )
}