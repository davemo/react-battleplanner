`/** @jsx React.DOM */`

units = require("../data/builds_default_units.js")()

CharacterSelector = React.createClass

  getInitialState: ->
    {data: _(_(units).groupBy("type")).tap (grouped) -> delete grouped.base}

  render: ->
    characterGroups = _(@state.data).map (characters, type) ->
      characterNodes = _(characters).map (character) ->
        classes = "character #{character.name}"
        `<li className={classes}>
          <div className="title">{character.name}</div>
          <div className="portrait"></div>
        </li>`

      `<div className="unit-type">
        <div className="title">{type}</div>
        <ul class="classes">{characterNodes}</ul>
      </div>
        `
    `<div className="wrapper">
      <div id="unit-groupings">{characterGroups}</div>
    </div>`

module.exports = CharacterSelector
