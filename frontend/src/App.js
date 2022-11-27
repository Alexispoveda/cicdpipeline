import logo from './logo.svg';
import './App.css';
import { useEffect } from 'react';

function App() {

  useEffect(() => {
    // Change title of the page
    document.title = process.env.NODE_ENV;
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
        Grupo: Saavedra, Fumero, Guerra, Jurado, Bilbao.
        </p>
        <p>
          Environment: {process.env.NODE_ENV} 😮‍💨
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
