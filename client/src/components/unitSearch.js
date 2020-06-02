import React, { Component } from 'react';
import Select from 'react-select'

export default class UnitSearch extends Component {
  constructor(props) {
    super(props)
    this.state = {id: null, selectOptions: []}
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  handleChange(e) {
    let selectOptions = this.state.selectOptions
    this.setState({id: e.value, selectOptions: selectOptions}, this.handleSubmit)
  }

  handleSubmit() {
    this.props.submit(this.state.id, this.props.info)
  }

  componentDidMount() {
    let selectOptions = []
    switch (this.props.options) {
      case 'civs':
        fetch(`api/civilizations`).then(response => response.json()).then(
          civs => {
            selectOptions = civs.map(civ => ({label: civ.name, value: civ.id}))
            this.setState({id: null, selectOptions: selectOptions}) 
          }
        )  
        break;
      case 'buildings':
        selectOptions = [
          {label: 'Barracks', value: 'Barracks'},
          {label: 'Monastery', value: 'Monastery'},
          {label: 'Siege Workshop', value: 'Siege Workshop'},
          {label: 'Castle', value: 'Castle'},
          {label: 'Stable', value: 'Stable'},
          {label: 'Archery Range', value: 'Archery Range'},
        ]
        this.setState({id: null, selectOptions: selectOptions})   
        break;
      default:
        fetch(`api/units`).then(response => response.json()).then( 
          units => {
            selectOptions = units.map(unit => ({label: unit.name, value: unit.id}))
            this.setState({id: null, selectOptions: selectOptions})                
          }
        ) 
    }
  }

  render () {
    let label = ''
    switch (this.props.info) {
      case 'civ':
        label = '... or list them by Civilization'
        break;
      case 'building':
        label = '...or list them by building'
        break;
      default:
        label = 'Select or search for a unit to get information on it!'
    }
      return (
        <div className='search container'>
          <div className='search-header'>{label}</div>
          <Select onChange={this.handleChange} options={this.state.selectOptions}/>
        </div>
      )
  }
}