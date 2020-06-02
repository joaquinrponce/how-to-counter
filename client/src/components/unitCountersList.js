import React, { Component } from 'react';
import UnitCounter from './unitCounter.js'
import CivFilter from './civFilter.js'
import UniqueFilter from './uniqueFilter.js'

export default class UnitCountersList extends Component {
  constructor(props) {
    super(props)
    this.state = {civ: null, changeCiv: this.changeCiv, hideUnique: false}
    this.changeCiv = this.changeCiv.bind(this)
    this.toggleUnique = this.toggleUnique.bind(this)
  }

  changeCiv(civ) {
    this.setState({civ: civ, changeCiv: this.changeCiv, hideUnique: this.state.hideUnique})
  }


  toggleUnique(value) {
    this.setState({civ: this.state.civ, changeCiv: this.changeCiv, hideUnique: value})
  }

  renderDirectCounters() {
    if (this.props.direct_counters.length === 0) return null
    let directCounters = []
    this.props.direct_counters.forEach(counter => {
      directCounters.push(<UnitCounter filters={{civ: this.state.civ, unique: this.state.hideUnique}} key={counter.id} counter={counter}/>)
    })
    return directCounters
  }
  renderTacticalCounters() {
    if (this.props.tactical_counters.length === 0) return null
    let tacticalCounters = []
    this.props.tactical_counters.forEach(counter => {
      tacticalCounters.push(<UnitCounter filters={{civ: this.state.civ, unique: this.state.hideUnique}} key={counter.id} counter={counter}/>)
    })
    return tacticalCounters
  }

  render () {
    let header = this.props.counters ? 'Weak Against' : 'Strong Against'
    return (
      <div className='unit-counters-list container'>
        <div className='header'>{header}</div>
        <div className='filters container'>
        { this.props.counters && <CivFilter changeCiv={this.changeCiv}/> }
        <UniqueFilter toggleUnique={this.toggleUnique}/>
        </div>
        <div className='header-small'>Hard Counters</div>
        <div className='unit-counters'>{this.renderDirectCounters()}</div>
        <div className='header-small'>Soft Counters</div>
        <div className='unit-counters'>{this.renderTacticalCounters()}</div>
      </div>
    )
  }
}
