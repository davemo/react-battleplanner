gulp       = require('gulp')
coffee     = require('gulp-coffee')
gutil      = require('gulp-util')
browserify = require('gulp-browserify')
react      = require('gulp-react')
concat     = require('gulp-concat')
less       = require('gulp-less')
server     = require('./server.coffee')

gulp.task 'coffee-reactify', ->
  gulp.src('./app/js/**/*.coffee')
    .pipe(coffee({bare:true, header: false}).on('error', gutil.log))
    .pipe(react())
    .pipe(gulp.dest('./workspace/'))

gulp.task 'browserify', ['coffee-reactify'], ->
  gulp.src('./workspace/startup.js')
    .pipe(browserify({debug: false}).on('error', gutil.log))
    .pipe(concat('app.js'))
    .pipe(gulp.dest('./build/'))

gulp.task 'less', ->
  gulp.src('./app/stylesheets/**/*.less')
    .pipe(less())
    .pipe(concat('app.css'))
    .pipe(gulp.dest('./build/'))

gulp.task 'dev-server', ['browserify'], ->
  server.listen(3000)
  gutil.log 'server listening on port 3000'

gulp.task 'default', ->
  gulp.run 'coffee-reactify', 'browserify', 'less', 'dev-server'

  gulp.watch './app/js/**/*.coffee', ->
    gulp.run 'coffee-reactify', 'browserify'

  gulp.watch './app/stylesheets/**/*.less', ->
    gulp.run 'less'