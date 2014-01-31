`/** @jsx React.DOM */`

units = require("../data/builds_default_units.js")()

CharacterSelector = React.createClass

  getInitialState: ->
    {data: units}

  render: ->
    characterNodes = @state.data.map (character) ->
      classes = "character #{character.name}"
      `<li className={classes}>
        <div className="title">{character.name}</div>
        <div className="portrait"></div>
      </li>`

    `<div className="wrapper">
        <div id="unit-groupings">
          <ul>{characterNodes}</ul>
        </div>
      </div>`

module.exports = CharacterSelector
