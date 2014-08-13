gulp       = require 'gulp'
prefixer   = require 'gulp-autoprefixer'
clean      = require 'gulp-clean'
coffee     = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat     = require 'gulp-concat'
jade       = require 'gulp-jade'
mincss     = require 'gulp-minify-css'
plumber    = require 'gulp-plumber'
sass       = require 'gulp-ruby-sass'
sequence   = require 'run-sequence'

gulp.task 'bower', ->

gulp.task 'clean', ->
  gulp.src 'dst'
    .pipe clean()

gulp.task 'coffee', ->
  gulp.src 'src/coffee/**/*.coffee'
    .pipe plumber()
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe coffee()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/js/'

gulp.task 'copy', ->

gulp.task 'jade', ->
  gulp.src 'src/jade/index.jade'
    .pipe plumber()
    .pipe jade()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst'
  gulp.src 'src/jade/view/*.jade'
    .pipe plumber()
    .pipe jade()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/view/'

gulp.task 'sass', ->
  gulp.src ['src/sass/*.sass', 'src/sass/styles/*.sass']
    .pipe plumber()
    .pipe concat 'style.sass'
    .pipe sass
      compass: true
      bundleExec:true
    .pipe prefixer 'last 3 version'
    .pipe mincss()
    .pipe plumber.stop()
    .pipe gulp.dest 'dst/css/'


## Tasks
# Build Task
gulp.task 'build', -> 
  sequence 'clean', ['bower', 'copy', 'sass', 'coffee', 'jade']
