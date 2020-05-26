import React, { Component } from 'react';
import UnitName from './unitName.js'

export default class UnitCountered extends Component {
  render() {
    return (
      <div className='unit-info unit-countered container'>
      <UnitName unit={this.props.counter.countered_unit}/>
      <div className='unit-info unit-counter-description'>{this.props.counter.description}</div>
      </div>
    )
  }
}