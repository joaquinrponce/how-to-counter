import React, { Component } from 'react';
import Select from 'react-select'

export default class UnitSearch extends Component {
  constructor() {
    super()
    this.state = {id: null, selectOptions: []}
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  handleChange(e) {
    let selectOptions = this.state.selectOptions
    this.setState({id: e.value, selectOptions: selectOptions}, this.handleSubmit)
  }

  handleSubmit() {
    this.props.submit(this.state.id)
  }

  componentDidMount() {
    let selectOptions = []
    fetch(`api/units`).then(response => response.json()).then( units => {
      selectOptions = units.map(unit => ({label: unit.name, value: unit.id}))
      this.setState({id: null, selectOptions: selectOptions})
    })
  }

  render () {
      return (
        <div className='search-select'>
          <Select onChange={this.handleChange} options={this.state.selectOptions}/>
        </div>
      )
  }
}