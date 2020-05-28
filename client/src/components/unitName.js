import React, { Component } from 'react';
import { UnitID } from './UnitIDContext.js'

export default class UnitName extends Component {
  render () {
    return (
      <UnitID.Consumer>
        {({id, submit}) => (<div onClick={() => { submit(this.props.id) }} className='unit-name'>
          {this.props.name}
          </div>)
        }
      </UnitID.Consumer>
    )
  }
}