import React, { Component } from 'react';
import UnitCountersList from './unitCountersList.js'
import UnitCounteredList from './unitCounteredList.js'
import UnitDescription from './unitDescription.js'
import UnitStats from './unitStats.js'
import UnitName from './unitName.js'


export default class UnitDisplay extends Component {
  render () {
    return (
    <div className='unit-display container'>
      <div className='unit-display unit-info-main container'>
        <UnitName unit={this.props.unit}/>
        <UnitDescription unit={this.props.unit}/>
        <UnitStats unit={this.props.unit}/>
      </div>
      <div className='unit-display unit-info-counters container'>
        <UnitCountersList unit={this.props.unit}/>
        <UnitCounteredList unit={this.props.unit}/>
      </div>
    </div>
    )
  }
}