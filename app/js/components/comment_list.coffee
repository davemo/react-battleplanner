`/** @jsx React.DOM */`

Comment = require("./comment.js")

CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      `<Comment author={comment.author}>{comment.text}</Comment>`
    `<div className="commentList">{commentNodes}</div>`

module.exports = CommentList