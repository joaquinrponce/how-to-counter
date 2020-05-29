import React, { Component } from 'react';

export default class UnitAdvice extends Component {
  render () {
    return(
        <div className='unit-advice container'>
          <div className='header'>Advice</div>
          <div className='advice-description'>{this.props.advice}</div>
        </div>
    )
  }
}