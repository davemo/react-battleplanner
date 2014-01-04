express  = require('express')
app      = express()
comments = [{author: "Dave Mosher",text:"Hey there!"}]

app.use '/', express.static(__dirname + "/build")
app.use express.bodyParser()

app.get '/comments.json', (req, res) ->
  res.json(comments)

app.post '/comments.json', (req, res) ->
  comments.push req.body
  res.json(comments)

module.exports = app