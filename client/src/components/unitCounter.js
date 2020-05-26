import React, { Component } from 'react';
import UnitName from './unitName.js'

export default class UnitCounter extends Component {
  render() {
    return (
      <div className='unit-info unit-counter container'>
      <UnitName unit={this.props.counter.counter_unit}/>
      <div className='unit-info unit-counter-description'>{this.props.counter.description}</div>
      </div>
    )
  }
}