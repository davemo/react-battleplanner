`/** @jsx React.DOM */`

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

module.exports = CommentForm