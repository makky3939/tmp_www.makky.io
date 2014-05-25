"use strict"
module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-open"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    open:
      dev:
        path: 'http://localhost:3939/'
        app: 'Google Chrome'

    connect:
      server:
        options:
          port: "3939"
          base: "dst"
          livereload: 35729
      livereload:
        options:
          open: true

    autoprefixer:
      options:
        browsers: [
          'last 3 version'
          'ie 9'
          'ie 8'
          'ie 7'
        ]
      default:
        src: "./dst/style/style.css"
        dest: "./dst/style/style.css"

    bower:
      install:
        options:
          targetDir: "./dst/lib"
          layout: "byComponent"
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: false

    watch:
      copy:
        files: "src/image/**"
        tasls: ["copy"]

      jade:
        files: '**/*.jade'
        tasks: ['jade']

      coffee:
        files: "**/*.coffee"
        tasks: ["coffee"]

      sass:
        files: "src/style/*.sass"
        tasks: ["concat:sass", "sass", "autoprefixer"]

      options:
        livereload: true

    jade:
      site:
        expand: true
        cwd: 'src/jade/'
        src: ['{,*/}*.jade']
        dest: 'dst/'
        ext: '.html'
        options:
          pretty: true

    coffee:
      # compile:
      #   options:
      #     join: true
      #   files:
      #     "dst/js/app.js": ["src/js/*.coffee"]

      glob_to_multiple:
        expand: true
        cwd: 'src/js/'
        src: ['**/*.coffee']
        dest: 'dst/js/'
        ext: '.js'

    sass:
      compile:
        options:
          style: 'expanded'
          compass: true
        files:
          "dst/style/style.css": "src/style/tmp/style.sass"

    copy:
      main:
        files: [
          {
            expand: true
            cwd: "src/image"
            src: ["**"]
            dest: "dst/image"
            flatten: false
          }
        ]

    clean:
      build: ["dst"]

    concat:
      sass:
        src: [
          'src/style/init.sass'
          'src/style/color.sass'
          'src/style/*.sass'
        ],
        dest: 'src/style/tmp/style.sass'


  grunt.registerTask "build", [
    "clean"
    "bower:install"
    "concat"
    "sass"
    "autoprefixer"
    "coffee"
    "copy"
    "jade"
  ]

  grunt.registerTask "serve", [
    "connect"
    "open"
    "watch"
  ]

  grunt.registerTask 'server', () ->
    grunt.log.warn 'The `server` task has been deprecated. Use `grunt serve` to start a server.'
    grunt.task.run ['build']
    grunt.task.run ['serve']

  return