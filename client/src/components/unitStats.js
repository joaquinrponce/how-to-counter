import React, { Component } from 'react';

export default class UnitStats extends Component {
  render () {
    let unit = this.props.unit
    return (
      <div className='unit-stats container'>
        <div className='unit-stats header'>Stats</div>
        <div className='unit-stat'><span>Attack:</span> {unit.attack}</div>
        <div className='unit-stat'><span>Melee Armor:</span> {unit.armor}</div>
        <div className='unit-stat'><span>Pierce Armor:</span> {unit.pierce_armor}</div>
        <div className='unit-stat'><span>HP:</span> {unit.hp}</div>
      </div>
    )
  }
}