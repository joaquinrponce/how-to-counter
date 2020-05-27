import React, { Component } from 'react';
import UnitCountersList from './unitCountersList.js'
import UnitDescription from './unitDescription.js'
import UnitStats from './unitStats.js'
import UnitName from './unitName.js'
import UnitPicture from './unitPicture.js'


export default class UnitDisplay extends Component {
  render () {
    return (
    <div className='unit-display container'>
      <div className='unit-display unit-info-main container'>
        <div className='unit-display unit-info unit-name-picture container'>
        <UnitName name={this.props.unit.name}/>
        <UnitPicture size='big' url={this.props.unit.picture_url}/>
        </div>
        <UnitDescription description={this.props.unit.description}/>
        <UnitStats unit={this.props.unit}/>
      </div>
      <div className='unit-display unit-info-counters container'>
        <UnitCountersList counters={true}  direct_counters={this.props.unit.direct_counters} tactical_counters={this.props.unit.tactical_counters}/>
        <UnitCountersList counters={false} direct_counters={this.props.unit.direct_countered} tactical_counters={this.props.unit.tactical_countered}/>
      </div>
    </div>
    )
  }
}