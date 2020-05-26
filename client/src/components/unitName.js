import React, { Component } from 'react';

export default class UnitName extends Component {
  render () {
    return (
      <div className='unit-info unit-name'>{this.props.unit.name}</div>
    )
  }
}