module.exports = (grunt) ->

  grunt.initConfig
    coffee:
      default:
        options:
          bare: yes
        files:
          "dist/js/app.js": "src/coffee/app.coffee"

    less:
      default:
        files: 
          "dist/css/app.css": "src/less/app.less"
      prod:
        options:
          compress: yes
        files: 
          "dist/css/app.min.css": "src/less/app.less"

    uglify:
      default:
        options: {}
        files: 
          "dist/js/app.min.js": "dist/js/app.js"

    watch:
      default:
        files: ["media/coffee/*", "media/less/*"]
        tasks: ["coffee", "less:dev"]
      coffee:
        files: "media/coffee/*",
        tasks: ['coffee']
      less:
        files: "media/less/*",
        tasks: ['less']

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default",    ["coffee", "less:default"]
  grunt.registerTask "production", ["coffee", "less:prod", "uglify"]
