import React, { Component } from 'react'

export default class CollapseButton extends Component {
  constructor (props) {
    super(props)
    this.state = {collapsed: true}
    this.handleClick = this.handleClick.bind(this)
  }
  handleClick (e) {
    e.preventDefault();
    let collapsed = !this.state.collapsed
    this.setState({collapsed: collapsed})
    this.props.onClick()
  }
  render () {
    let icon = this.state.collapsed ? '+' : '-'
    return (
      <button onClick={this.handleClick} className='collapse' type='button'>{icon}</button>
    )
  }
}