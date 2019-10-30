import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

import { fetchCategories } from '../api';

export default ({ verticalId }) => {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    fetchCategories(verticalId).then((response) => {
      setCategories(response.data.data);
    });
  }, []);

  return (
    <ul className="categories">
      {categories.map(category => (
        <li key={category.id}>
          <Link to={`/categories/${category.id}`}>{category.attributes.name}</Link>
        </li>
      ))}
    </ul>
  )
}