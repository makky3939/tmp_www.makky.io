bower        = require 'bower'
gulp         = require 'gulp'
autoprefixer = require 'gulp-autoprefixer'
coffee       = require 'gulp-coffee'
coffeelint   = require 'gulp-coffeelint'
concat       = require 'gulp-concat'
connect      = require 'gulp-connect'
flatten      = require 'gulp-flatten'
jade         = require 'gulp-jade'
minifycss    = require 'gulp-minify-css'
notify       = require 'gulp-notify'
plumber      = require 'gulp-plumber'
sass         = require 'gulp-ruby-sass'
uglify       = require 'gulp-uglify'
watch        = require 'gulp-watch'
rimraf       = require 'rimraf'
sequence     = require 'run-sequence'

gulp.task 'bower', ->
  bower.commands.install().on 'end', (installed) ->
    gulp.src [
      'bower_components/bootstrap/dist/css/bootstrap.min.css'
      'bower_components/bootstrap/dist/css/bootstrap.css.map'
      'bower_components/bootstrap/dist/js/bootstrap.min.js'
    ]
      .pipe gulp.dest './dst/lib/bootstrap/'

    gulp.src [
      'bower_components/fontawesome/fonts/*'
    ]
      .pipe gulp.dest './dst/lib/fonts/'

    gulp.src [
      'bower_components/fontawesome/css/font-awesome.min.css'
    ]
      .pipe gulp.dest './dst/lib/fontawesome/'

    gulp.src [
      'bower_components/jquery/dist/jquery.min.js'
      'bower_components/jquery/dist/jquery.min.map'
    ]
      .pipe gulp.dest './dst/lib/jquery/'

gulp.task 'clean', (callback)->
  rimraf './dst', callback

gulp.task 'coffee', ->
  gulp.src 'src/coffee/**/*.coffee'
    .pipe plumber {errorHandler: notify.onError('<%= error.message %>')}
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe concat 'app.coffee'
    .pipe coffee()
    .pipe uglify {mangle: false}
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/js/'

gulp.task 'connect', ->
  connect.server {
    root: ['dst']
    port: 3939
    livereload: true
    base: 'dst'
  }

gulp.task 'copy', ->
  gulp.src 'src/image/**', {base: 'src/image'}
    .pipe gulp.dest 'dst/image/'
  gulp.src 'src/robot/**'
    .pipe gulp.dest 'dst/'

gulp.task 'jade', ->
  gulp.src 'src/jade/*.jade'
    .pipe plumber {errorHandler: notify.onError('<%= error.message %>')}
    .pipe jade()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/'

gulp.task 'livereload', ->
  gulp.src ''
    .pipe connect.reload()

gulp.task 'sass', ->
  gulp.src 'src/sass/*.sass'
    .pipe plumber {errorHandler: notify.onError('<%= error.message %>')}
    .pipe concat 'style.sass'
    .pipe sass {noCache: true}
    .pipe autoprefixer ['last 2 version', 'ie 8', 'ie 9']
    .pipe minifycss()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/css/'

gulp.task 'watch', ->
  gulp.watch 'src/jade/**', ['jade', 'livereload']
  gulp.watch 'src/coffee/**', ['coffee', 'livereload']
  gulp.watch 'src/sass/**', ['sass', 'livereload']
  gulp.watch 'src/image/**', ['copy', 'livereload']

# Build Task
gulp.task 'build', ['clean'], -> 
  sequence ['bower', 'copy', 'sass', 'coffee', 'jade']

# Develop Task
gulp.task 'server', ->
  sequence ['build'], 'watch', 'connect'