import React, { Component } from 'react';

export default class UnitDescription extends Component {
  render (){
    return (
      <div className='unit-info unit-description'>{this.props.unit.description}</div>
    )
  }
}