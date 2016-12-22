'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');
var link = require('fs-symlink');
var mysql = require('mysql');
var glob = require("glob");
var mv = require('mv');
var fs = require('fs');
var pathExists = require('path-exists');
var request = require("request");
var md5 = require('md5');
var pk;

module.exports = yeoman.generators.Base.extend({
  prompting: function() {
    var t = this;
    var done = this.async();

    this.log(yosay(
      'Welcome to the official ' + chalk.red('pagekit') + ' generator!'
    ));

    var prompts = [{
      type: 'input',
      name: 'ProjectName',
      message: 'Choose your project name',
      default: 'Project'
    }, {
      type: 'input',
      name: 'Name',
      message: 'Name?',
      default: 'John Doe'
    }, {
      type: 'input',
      name: 'Email',
      message: 'Email?',
      default: 'john@doe.com'
    }, {
      type: 'input',
      name: 'DbUsername',
      message: 'Database username?',
      default: 'root'
    }, {
      type: 'input',
      name: 'DbPassword',
      message: 'Database password?',
      default: 'root'
    }, {
      type: 'input',
      name: 'DbHostname',
      message: 'Database hostname?',
      default: 'localhost'
    }, {
      type: 'input',
      name: 'User',
      message: 'Pagekit username?',
      default: 'user'
    }, {
      type: 'input',
      name: 'Pass',
      message: 'Pagekit password?',
      default: 'password'
    }];

    t.prompt(prompts, function(answers) {
      this.props = answers;
      done();
    }.bind(t));
  },

  writing: {
    app: function() {
      var t = this;
      pk = this.props;

      this.directory('pagekit', './').on('end', function() {
        
      });
    },
  }
});
