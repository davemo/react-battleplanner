`/** @jsx React.DOM */`

CommentForm = require("./comment_form.js")
CommentList = require("./comment_list.js")

CommentBox = React.createClass
  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      success: (data) =>
        @setState {data}

  handleCommentSubmit: (comment) ->
    comments = @state.data
    comments.push comment
    $.ajax
      url: @props.url
      type: 'POST'
      data: comment
      success: (data) =>
        @setState {data}

  getInitialState: ->
    {data: []}

  componentWillMount: ->
    @loadCommentsFromServer()
    setInterval(@loadCommentsFromServer, @props.pollInterval)

  render: ->
    `<div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={this.state.data}></CommentList>
      <CommentForm onCommentSubmit={this.handleCommentSubmit}></CommentForm>
     </div>`

module.exports = CommentBox