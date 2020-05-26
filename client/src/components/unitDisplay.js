import React, { Component } from 'react';

export default class UnitDisplay extends Component {
  render () {
    return (
    <div>
      <div>{this.props.unit.name}</div>
      <div>{this.props.unit.description}</div>
    </div>
    )
  }
}