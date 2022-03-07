import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Hase from './Hase';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header style="background: dark blue">
          <h1>Fibbonaci Calculator</h1>
          <img src={logo} className="App-logo" alt="logo" />
          <Link to="/">Home</Link>
          <Link to="/hase">Hase?</Link>
        </header>
        <div>
          <Route exact path="/" component={Fib} />
          <Route path="/hase" component={Hase} />
        </div>
      </div>
    </Router>
  );
}

export default App;
