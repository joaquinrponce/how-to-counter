import React, { Component } from 'react';

export default class UnitDescription extends Component {
  render (){
    return (
      <div className='unit-description'>
        {this.props.description}
      </div>
    )
  }
}