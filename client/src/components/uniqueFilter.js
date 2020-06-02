import React, { Component } from 'react';

export default class UniqueFilter extends Component {
  constructor(props) {
    super(props)
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(e) {
    this.props.toggleUnique(e.target.checked)
  }

  render() {
    return (
      <div className='unique-filter'>
          <label for='unique'>Hide unique units</label>
          <input type='checkbox' onChange={this.handleChange}/>
      </div>
    )
  }
}