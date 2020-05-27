import React, { Component } from 'react';
import UnitDisplay from './unitDisplay'

export default class UnitInfo extends Component {
  constructor(props) {
    super(props)
    this.state = {unit: null}
    this.getData = this.getData.bind(this)
  }

  getData() {
    fetch(`api/units/${this.props.id}`).then(response => 
      response.json()).then(data => {
        this.setState({unit: data})
      } 
    )
  }

  componentDidMount() {
    this.getData()
  }

  componentDidUpdate (prevProps, prevState) {
    if (this.props !== prevProps) {
      this.getData()
    }
  }

  render () {
    if (!this.state.unit) {
      return (
        <div>Loading data...</div>
      )
    } else {
      return (
          <UnitDisplay key={this.state.unit.id} unit={this.state.unit}/>
      )
    }
  }
}