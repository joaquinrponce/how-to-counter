import React, { Component } from 'react';
import Civilization from './civilization.js'

export default class UnitCivilizationsList extends Component {
  render() {
    if (!this.props.civs) return null
    let civs = []
    this.props.civs.forEach(civ => {
      civs.push(<Civilization key={civ.id} civ={civ}/>)
    })
    return (
      <div className='civilization-list container'>{civs}</div>
    )
  }
}