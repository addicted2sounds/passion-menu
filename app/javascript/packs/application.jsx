import React from 'react'
import ReactDOM from 'react-dom'

import App from 'bundles/app'

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById('app');
  ReactDOM.render(
    <App token={element.dataset['token']}/>, element
  )
})
