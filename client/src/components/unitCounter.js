import React, { Component } from 'react';
import UnitName from './unitName.js'
import UnitPicture from './unitPicture.js'
import CollapseButton from './collapseButton.js'

export default class UnitCounter extends Component {
  constructor(props) {
    super(props)
    this.state = {collapsed: true}
    this.collapse = this.collapse.bind(this)
  }

  collapse() {
    let collapsed = this.state.collapsed ? false : true
    this.setState({collapsed: collapsed})
  }

  render() {
    let unit = this.props.counter.counter_unit ? this.props.counter.counter_unit : this.props.counter.countered_unit
    return (
      <div className='unit-counter container'>
        <UnitPicture size='small' url={unit.picture_url}/>
        <div className='unit-counter-description container'>
          <div className='unit-name-collapse container'>
          <UnitName name={unit.name} id={unit.id}/>
          <CollapseButton onClick={this.collapse}/>
          </div>
          { !this.state.collapsed && <div className='counter-description'>
              {this.props.counter.description}
            </div> }
        </div>
      </div>
    )
  }
}