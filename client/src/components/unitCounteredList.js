import React, { Component } from 'react';
import UnitCountered from './unitCountered.js'

export default class UnitCountersList extends Component {
  renderDirectCountered() {
    let directCountered = []
    this.props.unit.direct_countered.forEach(counter => {
      directCountered.push(<UnitCountered key={counter.id} counter={counter}/>)
    })
    return directCountered
  }
  renderTacticalCountered() {
    let tacticalCountered = []
    this.props.unit.tactical_countered.forEach(counter => {
      tacticalCountered.push(<UnitCountered key={counter.id} counter={counter}/>)
    })
    return tacticalCountered
  }
  render () {
    return (
      <div className='unit-info unit-counters container'> 
        <div className='unit-info unit-counters counters-wrapper'>
          <div className='unit-info container header'>Strong Against</div>
            <div className='unit-info header-small'>Directly Counters</div>
            <div className='unit-info unit-direct-counters'>{this.renderDirectCountered()}</div>
            <div className='unit-info header-small'>Tactically Counters</div>
            <div className='unit-info unit-tactical-counters'>{this.renderTacticalCountered()}</div>
        </div>
      </div>
    )
  }
}