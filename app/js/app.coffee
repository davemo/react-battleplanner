`/** @jsx React.DOM */`

converter = new Showdown.converter

Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    `<div className="comment">
      <h2 className="comment">{this.props.author}</h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>`

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

CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      `<Comment author={comment.author}>{comment.text}</Comment>`
    `<div className="commentList">{commentNodes}</div>`

CommentForm = React.createClass
  handleSubmit: ->
    author = @refs.author.getDOMNode().value.trim()
    text   = @refs.text.getDOMNode().value.trim()
    @props.onCommentSubmit {author, text}
    @refs.author.getDOMNode().value = ""
    @refs.text.getDOMNode().value   = ""
    false

  render: ->
    `<form className="commentForm" onSubmit={this.handleSubmit}>
      <input type="text" placeholder="Your name" ref="author" />
      <input type="text" placeholder="Say something..." ref="text" />
      <input type="submit" value="Post" />
    </form>`

module.exports =
  start: ->
    React.renderComponent(`<CommentBox url="/comments.json" pollInterval={2000} />`, $("#container")[0])