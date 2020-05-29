import React, { Component } from 'react';
import UnitName from './unitName.js'
import UnitDescription from './unitDescription.js'
import UnitPicture from './unitPicture.js'

export default class UnitListing extends Component {
  constructor(props) {
    super(props)
    this.state = {units: null}
    this.getData = this.getData.bind(this)
  }

  getData() {
    switch (this.props.info) {
      case 'building': 
       fetch(`api/units/search?building=${this.props.id}`).then(response => response.json()).then(units => {
          this.setState({units: units})
        })
      break;
      case 'civ':
        fetch(`api/units/search?civilization=${this.props.id}`).then(response => response.json()).then(units => {
          this.setState({units: units})
        })
      break;
      default:
        fetch(`api/units`).then(response => response.json()).then(units => {
          this.setState({units: units})
        })
    }
  }

  componentDidMount() {
      this.getData()
  }

  componentDidUpdate(prevProps, prevState) {
    if (prevProps !== this.props) {
      this.getData()
    }
  }

  render () {
    if (!this.state.units) {
      return null
    } else {
      console.log('supposedly rendering something')
      let units = []
      this.state.units.forEach(unit => {
        units.push(
        <div className='unit-individual container'>
          <div className='unit-name-picture container'>
            <UnitPicture url={unit.picture_url} size='small'/>
            <UnitName id={unit.id} name={unit.name}/>
          </div>
          <UnitDescription description={unit.description}/>
        </div>)
      })
      return (
        <div className='unit-listing container'>
          {units}
        </div>
      )
    }
  }
}