import React from 'react';
import { Switch, Route, BrowserRouter } from 'react-router-dom';
import './App.css';
import HomePage from './components/homepage/index';
import PlayGround from './components/play/playGround';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Switch>
          <Route exact path="/" component={HomePage} />
          <Route path="/play" component={PlayGround} />
        </Switch>
      </BrowserRouter>
    </div>
  );
}

export default App;