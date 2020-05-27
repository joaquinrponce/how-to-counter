import React, { Component } from 'react';
import UnitName from './unitName.js'
import UnitPicture from './unitPicture.js'

export default class UnitCounter extends Component {
  render() {
    let unit = this.props.counter.counter_unit ? this.props.counter.counter_unit : this.props.counter.countered_unit
    return (
      <div className='unit-info unit-counter container'>
      <UnitPicture size='small' url={unit.picture_url}/>
      <div className='unit-counter-description'>
        <UnitName name={unit.name}/>
        <div className='unit-info unit-description'>{this.props.counter.description}</div>
      </div>
      </div>
    )
  }
}