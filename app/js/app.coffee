`/** @jsx React.DOM */`

converter   = new Showdown.converter
CommentBox  = require("./components/comment_box.js")

module.exports =
  start: ->
    React.renderComponent(`<CommentBox url="/comments.json" pollInterval={2000} />`, $("#container")[0])