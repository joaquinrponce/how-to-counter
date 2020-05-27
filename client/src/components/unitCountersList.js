import React, { Component } from 'react';
import UnitCounter from './unitCounter.js'

export default class UnitCountersList extends Component {
  renderDirectCounters() {
    let directCounters = []
    this.props.unit.direct_counters.forEach(counter => {
      directCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return directCounters
  }
  renderTacticalCounters() {
    let tacticalCounters = []
    this.props.unit.tactical_counters.forEach(counter => {
      tacticalCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return tacticalCounters
  }
  render () {
    return (
      <div className='unit-info unit-counters container'>
        <div className='unit-info unit-counters counters-wrapper'>
          <div className='unit-info container header'>Weak Against</div>
          <div className='unit-info header-small'>Direct Counters</div>
          <div className='unit-info unit-direct-counters'>{this.renderDirectCounters()}</div>
          <div className='unit-info header-small'>Tactical Counters</div>
          <div className='unit-info unit-tactical-counters'>{this.renderTacticalCounters()}</div>
        </div>
      </div>
    )
  }
}