import React, { Component } from 'react'
import UnitPicture from './unitPicture.js'
import UnitName from './unitName.js'

export default class UnitTree extends Component {

  render () {
    if (!this.props.tree) return null
    let units = []
    this.props.tree.units.forEach(unit => {
      units.push(<div className='unit-tree-element container'>
        <UnitPicture url={unit.picture_url} size='small'/>
        <UnitName name={unit.name} id={unit.id}/>
      </div>)
    })
    return (
      <div className='unit-tree-main'>
        <div className='header'>
          {this.props.tree.name}
        </div>
        <div className='unit-tree'>
          {units}
        </div>
      </div>
    )
  }
}