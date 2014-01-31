`/** @jsx React.DOM */`

Loadout = require("./components/loadout.js")
CharacterSelector = require("./components/character_selector.js")

module.exports =
  start: ->
    React.renderComponent(`<Loadout />`, $("#loadout")[0])
    React.renderComponent(`<CharacterSelector />`, $("#character-selector")[0])
