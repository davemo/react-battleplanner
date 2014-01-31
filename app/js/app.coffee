`/** @jsx React.DOM */`

CharacterSelector = require("./components/character_selector.js")

module.exports =
  start: ->
    React.renderComponent(`<CharacterSelector />`, $("#character-selector")[0])
