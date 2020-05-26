import React, { Component } from 'react';

export default class UnitStats extends Component {
  render () {
    let unit = this.props.unit
    return (
      <div className='unit-info unit-stats'>
      <div className='unit-info unit-stats header'>Stats</div>
      <div className='unit-info unit-attack'><span>Attack:</span> {unit.attack}</div>
      <div className='unit-info unit-armor'><span>Armor:</span> {unit.armor}</div>
      <div className='unit-info unit-hp'><span>HP:</span> {unit.hp}</div>
      </div>
    )
  }
}