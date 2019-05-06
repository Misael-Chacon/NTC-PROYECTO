import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            BIENVENIDO A NTC (NOTAS, TAREAS, CLASES)
          </p>
          <a className="App-link" href="https://www.unah.edu.hn/" target="_blank" rel="noopener noreferrer">
          Universidad UNAH
          </a>
          <a className="App-link" href="http://www.unitec.edu/" target="_blank" rel="noopener noreferrer">
          Universidad UNITEC
          </a>
          <a className="App-link" href="http://www.ceutec.hn/" target="_blank" rel="noopener noreferrer">
          Universidad CEUTEC
          </a>
        </header>
      </div>
    );
  }
}

export default App;
