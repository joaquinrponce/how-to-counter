import React, { Component } from 'react';
import UnitCounter from './unitCounter.js'
import CivFilter from './civFilter.js'

export default class UnitCountersList extends Component {
  constructor(props) {
    super(props)
    this.state = {civ: null, changeCiv: this.changeCiv}
    this.filterCiv = this.filterCiv.bind(this)
    this.changeCiv = this.changeCiv.bind(this)
  }

  changeCiv(civ) {
    this.setState({civ: civ, changeCiv: this.changeCiv})
  }

  filterCiv(civilizations) {
    let found = false
    civilizations.forEach(civ => {
      if (civ.name === this.state.civ) { 
        found = true
        }
      }
    )
    return found
  }

  renderDirectCounters() {
    if (this.props.direct_counters.length === 0) return null
    let directCounters = []
    this.props.direct_counters.forEach(counter => {
      if (this.state.civ && this.props.counters) {
        if (!this.filterCiv(counter.counter_unit.civilizations)) return null
      }
      directCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return directCounters
  }
  renderTacticalCounters() {
    if (this.props.tactical_counters.length === 0) return null
    let tacticalCounters = []
    this.props.tactical_counters.forEach(counter => {
      if (this.state.civ && this.props.counters) {
        if (!this.filterCiv(counter.counter_unit.civilizations)) return null
      }
      tacticalCounters.push(<UnitCounter key={counter.id} counter={counter}/>)
    })
    return tacticalCounters
  }

  render () {
    let header = this.props.counters ? 'Weak Against' : 'Strong Against'
    return (
      <div className='unit-counters-list container'>
        <div className='header'>{header}</div>
        { this.props.counters && <CivFilter changeCiv={this.changeCiv}/> }
        <div className='header-small'>Hard Counters</div>
        <div className='unit-counters'>{this.renderDirectCounters()}</div>
        <div className='header-small'>Soft Counters</div>
        <div className='unit-counters'>{this.renderTacticalCounters()}</div>
      </div>
    )
  }
}
