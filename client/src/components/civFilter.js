import React, { Component } from 'react';
import Select from 'react-select'

export default class CivFilter extends Component {
  constructor(props) {
    super(props)
    this.state = {selectOptions: []}
    this.handleChange = this.handleChange.bind(this)
  }

  componentDidMount() {
    let selectOptions = []
    fetch(`api/civilizations`).then(response => response.json()).then(
      civs => {
        selectOptions = civs.map(civ => ({label: civ.name, value: civ.name}))
        selectOptions.unshift({label: 'No filter', value: null}) 
        this.setState({selectOptions: selectOptions}) 
        }
    )
  }

  handleChange(e) {
    this.props.changeCiv(e.value)
  }

  /*customStyles = {
    control: (base, state) => ({
      ...base,
      height: '20px',
      'min-height': '20px',
      'font-size': '8pt',
    }),
  };*/

  render () {
    return (
      <div className='civ-filter container'>
      <div className='civ-filter-label'>Show only units available for:</div>
      <Select styles={this.customStyles} className='civ-filter-select' height='20px' options={this.state.selectOptions} onChange={this.handleChange}/>
      </div>
    )
  }
}