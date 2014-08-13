bower      = require 'bower'
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
  bower.commands.install().on 'end', (installed) ->
    gulp.src([
      'bower_components/angular/angular.min.js'
      'bower_components/angular/angular.min.js.map'
      'bower_components/angular/angular-csp.css'
    ]).pipe gulp.dest('./dst/lib/angular/')

    gulp.src([
      'bower_components/angular-ui-router/release/angular-ui-router.min.js'
    ]).pipe gulp.dest('./dst/lib/angular-ui-router/')

    gulp.src([
      'bower_components/angulartics/dist/angulartics.min.js'
      'bower_components/angulartics/dist/angulartics-ga.min.js'
    ]).pipe gulp.dest('./dst/lib/angulartics/')

    gulp.src([
      'bower_components/bootstrap/dist/css/bootstrap.min.css'
      'bower_components/bootstrap/dist/css/bootstrap.css.map'
      'bower_components/bootstrap/dist/js/bootstrap.min.js'
    ]).pipe gulp.dest('./dst/lib/bootstrap/')

    gulp.src([
      'bower_components/bootstrap/dist/fonts/*'
    ]).pipe gulp.dest('./dst/lib/fonts/')

    gulp.src([
      'bower_components/jquery/dist/jquery.min.js'
      'bower_components/jquery/dist/jquery.min.map'
    ]).pipe gulp.dest('./dst/lib/jquery/')

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
  gulp.src 'src/image/**', {base: 'src/image'}
    .pipe gulp.dest 'dst/image/'

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
