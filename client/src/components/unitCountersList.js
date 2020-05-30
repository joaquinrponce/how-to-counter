import React, { Component } from 'react';
import UnitCounter from './unitCounter.js'

export default class UnitCountersList extends Component {
  renderDirectCounters() {
    if (this.props.direct_counters.length === 0) return null
    let directCounters = []
    this.props.direct_counters.forEach(counter => {
      directCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return directCounters
  }
  renderTacticalCounters() {
    if (this.props.tactical_counters.length === 0) return null
    let tacticalCounters = []
    this.props.tactical_counters.forEach(counter => {
      tacticalCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return tacticalCounters
  }
  render () {
    let header = this.props.counters ? 'Weak Against' : 'Strong Against'
    return (
      <div className='unit-counters-list container'>
        <div className='header'>{header}</div>
        <div className='header-small'>Hard Counters</div>
        <div className='unit-counters'>{this.renderDirectCounters()}</div>
        <div className='header-small'>Soft Counters</div>
        <div className='unit-counters'>{this.renderTacticalCounters()}</div>
      </div>
    )
  }
}
