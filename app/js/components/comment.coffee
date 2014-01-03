`/** @jsx React.DOM */`

converter = new Showdown.converter

Comment = React.createClass
  render: ->
    rawMarkup = converter.makeHtml @props.children.toString()
    `<div className="comment">
      <h2 className="comment">{this.props.author}</h2>
      <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
    </div>`

module.exports = Comment