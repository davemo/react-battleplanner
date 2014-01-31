`/** @jsx React.DOM */`

defaultLoadoutUnits = require("../data/builds_default_units.js").defaultLoadoutUnits()

Loadout = React.createClass

  getInitialState: ->
    {data:defaultLoadoutUnits}

  render: ->
    loadoutNodes = _(@state.data).map (character) ->
      classes = "character #{character.name}"
      `<li className={classes}>
        <div className="title">{character.name}</div>
        <div className="portrait">
          <span className="help-text">Click a unit below</span>
        </div>
        <span className="remove">x</span>
        <ul className="stats-overlay">
          <li className="armor">-1</li>
          <li className="strength">-1</li>
          <li className="willpower">-1</li>
          <li className="exertion">-1</li>
          <li className="break">-1</li>
        </ul>
        <div className="allocated-max-stats">
          <span className="allocated">{character.current}</span>/<span className="max">{character.max}</span>
        </div>
      </li>
      `
    `<div className="wrapper">
      <ul id="selected-characters">{loadoutNodes}</ul>
    </div>
    `

module.exports = Loadout
