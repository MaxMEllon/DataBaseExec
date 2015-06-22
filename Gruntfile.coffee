module.exports = (grunt) ->
  grunt.initConfig
    plg: grunt.file.readJSON("package.json")

    sass:
      build:
        src: "assets/app/sass/*.sass"
        dest: "assets/app/css/app.css"

    csslint:
      check:
        src: "<%= sass.build.dest>"

    csscss:
      check:
        src: "<%= sass.build.dest>"

    watch:
      files: "assets/app/**/*"
      tasks: [
        "sass"
        "csslint"
        "csscss"
      ]

  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-csscss"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", [
    "sass"
    "csslint"
    "csscss"
    "watch"
  ]
  return
