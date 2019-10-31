import React, { useState, useEffect} from 'react';

import { fetchCourses } from '../api';

export default ({ match: { params }}) => {
  const [courses, setCourses] = useState([]);
  useEffect(() => {
    fetchCourses(params.categoryId).then(
      response => setCourses(response.data.data)
    );
  }, [params.categoryId])
  return (
    <>
    {courses.map(course => (
      <section key={course.id}>
        <header><h2>{course.attributes.name}</h2></header>
        <div className="author">{course.attributes.author}</div>
      </section>
    ))}
    </>
  )
}
