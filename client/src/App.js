import React, { Component } from 'react';
import UnitInfo from './components/unitInfo'
import UnitSearch from './components/unitSearch'
import { UnitID } from './components/UnitIDContext.js'
import UnitListing from './components/unitListing.js'
import './App.css';

class App extends Component {
  constructor(){
    super()
    this.submit = this.submit.bind(this)
    this.state = {id: null, submit: this.submit, info: null}
    this.renderContent = this.renderContent.bind(this)
  }

  submit(id, info) {
    console.log(info)
    this.setState({id: id, submit: this.submit, info: info})
  }

  renderContent(){
    let content;
    switch (this.state.info) {
      case 'building':
        content = <UnitListing info={this.state.info} id={this.state.id}/>
        break;
      case 'civ':
        content = <UnitListing info={this.state.info} id={this.state.id}/>
        break;
      default:
        content =  <UnitInfo id={this.state.id}/>
        break;
    }
    return content
  }

  render() {
    if (!this.state.id || this.state.id === 0) {
      return (
        <div className="container container-main">
          <div className='container search-container'>
            <UnitSearch submit={this.submit} />
            <UnitSearch submit={this.submit} options='civs' info='civ'/>
            <UnitSearch submit={this.submit} options='buildings' info='building'/>
            </div>
        </div>
      )
    } else {
      return (
        <UnitID.Provider value={this.state}>
        <div className="container container-main">
          <div className='container search-container'>
            <UnitSearch submit={this.submit}/>
            <UnitSearch submit={this.submit} options='civs' info='civ'/>
            <UnitSearch submit={this.submit} options='buildings' info='building'/>
          </div>
            {this.renderContent()}
        </div>
        </UnitID.Provider>
      );
    }
  }
}

export default App;