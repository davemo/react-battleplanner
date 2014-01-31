gulp       = require('gulp')
coffee     = require('gulp-coffee')
log        = require('gulp-util').log
browserify = require('gulp-browserify')
react      = require('gulp-react')
concat     = require('gulp-concat')
server     = require('./server.coffee')

gulp.task 'coffee-reactify', ->
  gulp.src('./app/js/**/*.coffee')
    .pipe(coffee({bare:true, header: false}).on('error', log))
    .pipe(react())
    .pipe(gulp.dest('./build/'))

gulp.task 'browserify', ['coffee-reactify'], ->
  gulp.src('./build/startup.js')
    .pipe(browserify({debug: true}).on('error', log))
    .pipe(concat('browserify-bundle.js'))
    .pipe(gulp.dest('./build/'))

gulp.task 'dev-server', ['browserify'], ->
  server.listen(3000)
  log 'server listening on port 3000'

gulp.task 'watch', ->
  gulp.watch './app/js/**/*.coffee', ['coffee-reactify', 'browserify']

gulp.task 'default', ['dev-server', 'watch']


