import React, { Component } from 'react';

export default class UnitName extends Component {
  render () {
    return (
      <div className='unit-name'>
        {this.props.name}
      </div>
    )
  }
}