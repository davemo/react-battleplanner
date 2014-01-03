gulp       = require('gulp')
coffee     = require('gulp-coffee')
gutil      = require('gulp-util')
browserify = require('gulp-browserify')
react      = require('gulp-react')
concat     = require('gulp-concat')

gulp.task 'coffee-reactify', ->
  gulp.src('./app/js/**/*.coffee')
    .pipe(coffee({bare:true, header: false}).on('error', gutil.log))
    .pipe(react())
    .pipe(gulp.dest('./build/'))

gulp.task 'browserify', ['coffee-reactify'], ->
  gulp.src('./build/startup.js')
    .pipe(browserify({debug: false}).on('error', gutil.log))
    .pipe(concat('browserify-bundle.js'))
    .pipe(gulp.dest('./build/'))

gulp.task 'default', ->
  gulp.run 'coffee-reactify', 'browserify'

  gulp.watch './app/js/**/*.coffee', ->
    gulp.run 'coffee-reactify', 'browserify'