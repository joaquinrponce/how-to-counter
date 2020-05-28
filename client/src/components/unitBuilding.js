import React, { Component } from 'react';

export default class UnitBuilding extends Component {
  render () {
    let buildingUrl = "https://how-to-counter.s3.us-east-2.amazonaws.com/units/buildings/"
    switch (this.props.building) {
      case 'Barracks':
        buildingUrl += 'barracks.png'
        break;
      case 'Archery Range':
        buildingUrl += 'range.png'
        break;
      case 'Castle':
        buildingUrl += 'castle.png'
        break;
      case 'Stable':
        buildingUrl += 'stable.png'
        break;
      case 'Siege Workshop':
        buildingUrl += 'workshop.png'
        break;
      case 'Monastery':
        buildingUrl += 'monastery.png'
        break;
    }
    return( 
      <div className='unit-building container'>
        <img className='building-picture' width='35px' height='35px' src={buildingUrl}></img>
        <div className='building-name'>{this.props.building}</div>
      </div>
    )
  }
}