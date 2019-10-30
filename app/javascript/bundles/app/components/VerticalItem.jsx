import React, { useState, useEffect } from 'react';

export default ({vertical}) => {
  const [open, setOpen] = useState(false);
  const toggleIcon = open ? '[-]' : '[+]';
  const toggleMenu = () => setOpen(!open);
  return (
    <div className="vertical-title">
      <button onClick={toggleMenu}>
        <span>{toggleIcon}</span>&nbsp;
        {vertical.attributes.name}
      </button>
    </div>
  )
}