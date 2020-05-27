import React, { Component } from 'react';
import UnitInfo from './components/unitInfo'
import UnitSearch from './components/unitSearch'
import './App.css';

class App extends Component {
  constructor(){
    super()
    this.state = {id: null}
    this.submit = this.submit.bind(this)
  }

  submit(id) {
    console.log(this.state.id)
    this.setState({id: id})
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
        <div className="container container-main">
          <UnitSearch submit={this.submit}/>
          <UnitInfo id={this.state.id}/>
        </div>
      );
    }
  }
}

export default App;