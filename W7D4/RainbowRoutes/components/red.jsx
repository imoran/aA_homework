import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        {/* Links here */}
        <Link to='/red' >Red only</Link>
        <Link to='/red/yellow' >Add yellow</Link>


        {/* Routes here */}
        <Route path="/red/orange" component={Orange} />
        <Route path="/red/yellow" component={Yellow} />
      </div>
    );
  }
}

export default Red;
