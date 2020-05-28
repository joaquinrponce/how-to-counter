import React, { Component } from 'react';
import UnitInfo from './components/unitInfo'
import UnitSearch from './components/unitSearch'
import { UnitID } from './components/UnitIDContext.js'
import './App.css';

class App extends Component {
  constructor(){
    super()
    this.submit = this.submit.bind(this)
    this.state = {id: null, submit: this.submit}
  }

  submit(id) {
    console.log(id)
    this.setState({id: id, submit: this.submit})
  }

  render() {
    if (!this.state.id || this.state.id === 0) {
      return (
        <div className="container container-main">
            <UnitSearch submit={this.submit}/>
        </div>
      )
    } else {
      return (
        <UnitID.Provider value={this.state}>
        <div className="container container-main">
          <UnitSearch submit={this.submit}/>
          <UnitInfo id={this.state.id}/>
        </div>
        </UnitID.Provider>
      );
    }
  }
}

export default App;