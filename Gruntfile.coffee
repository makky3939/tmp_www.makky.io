module.exports = (grunt) ->
  "use strict"
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
      jade:
        files: '**/*.jade'
        tasks: ['jade']

      coffee:
        files: "**/*.coffee"
        tasks: ["coffee"]

      sass:
        files: "src/*.sass"
        tasks: ["concat:sass", "sass"]

    jade:
      site:
        expand: true
        cwd: 'src/jade'
        src: ['*.jade']
        dest: 'dst'
        ext: '.html'
        options:
          pretty: true

    coffee:
      compile:
        options:
          join: true
        files:
          "dst/js/app.js": ["src/js/*.coffee"]

    sass:
      compile:
        options:
          style: 'expanded'
          compass: true
        files:
          "dst/css/style.css": "src/css/tmp/style.sass"

    copy:
      main:
        files: [
          {
            expand: true
            src: ["src/image/*.*"]
            dest: "dst/image"
            flatten: true
          }
        ]

    clean:
      build: ["dst"]

    concat:
      sass:
        src: [
          'src/css/init.sass'
          'src/css/mixin.sass'
          'src/css/color.sass'
          'src/css/*.sass'
        ],
        dest: 'src/css/tmp/style.sass'


  grunt.registerTask "default", [
    "clean"
    "bower:install"
    "concat"
    "sass"
    "coffee"
    "copy"
    "jade"
  ]

  grunt.registerTask "server", [
    "clean"
    "bower:install"
    "concat"
    "sass"
    "coffee"
    "copy"
    "jade"
    "connect"
    "open"
    "watch"
  ]

  return