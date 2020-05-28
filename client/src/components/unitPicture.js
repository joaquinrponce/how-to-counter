import React, { Component } from 'react';

export default class UnitPicture extends Component {
  render () {
    let size = this.props.size === 'small' ? '35' : '150'
    return (
        <img alt='unit portrait' src={this.props.url} width={size} height={size}></img>
    )
  }
}