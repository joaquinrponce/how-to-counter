import React, { Component } from 'react';

export default class Civilization extends Component {
  render() {
    return(
      <div className='civilization container'>
        <img alt={this.props.civ.name} height='25px' width='25px' src={this.props.civ.picture_url}></img>
        <div className='civilization-name'>{this.props.civ.name}</div>
      </div>
    )
  }
}