import React, { Component } from 'react';
import UnitDisplay from './unitDisplay'

export default class UnitInfo extends Component {
  constructor(props) {
    super(props)
    this.state = {units: []}
  }

  componentDidMount () {
    fetch(`api/units`).then(response => 
      response.json()).then(data => {
        console.log(data)
        this.setState({units: data})
      }
    )
  }

  async getData() {
    let response = await fetch(`/api/units`)
    let data = await response.json()
    return data
  }
  renderUnit (unit) {
    return <UnitDisplay key={unit.id} unit={unit}/>
  }
  render () {
    let units = []
     this.state.units.forEach( unit => 
      {
      units.push(this.renderUnit(unit))
    }) 
    return (
      <div>{units}</div>
    )
  }
}