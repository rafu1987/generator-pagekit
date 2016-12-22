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
var bcrypt = require('bcryptjs');
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
      name: 'Db',
      message: 'Database?',
      default: 'database'
    }, {
      type: 'input',
      name: 'DbHostname',
      message: 'Database hostname?',
      default: 'localhost'
    }, {
      type: 'input',
      name: 'Name',
      message: 'Name?',
      default: 'John Doe'
    }, {
      type: 'input',
      name: 'Username',
      message: 'Pagekit username?',
      default: 'username'
    }, {
      type: 'input',
      name: 'Pass',
      message: 'Pagekit password?',
      default: 'password'
    }, {
      type: 'input',
      name: 'Email',
      message: 'Email?',
      default: 'john@doe.com'
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
        configfile();
        processSqlFile();
      });
    },
  }
});

function configfile() {
  fs.readFile('config.php', 'utf8', function(err, content) {
    var newContent = substituteMarker(content, '###DB###', pk.Db, true);
    newContent = substituteMarker(newContent, '###HOST###', pk.DbHostname, true);
    newContent = substituteMarker(newContent, '###USER###', pk.DbUsername, true);
    newContent = substituteMarker(newContent, '###PASS###', pk.DbPassword, true);

    fs.writeFile('config.php', newContent, 'utf8', function(err) {});
  });
}

function processSqlFile() {
  // Read sql file
  fs.readFile('./db.sql', 'utf8', function(err, data) {
    if (err) {
      console.log(err);
    }

    var salt = bcrypt.genSaltSync(10);
    var hash = bcrypt.hashSync(pk.Pass, salt);

    var result = substituteMarker(data, '###PASS###', hash, false);
    result = substituteMarker(result, '###NAME###', pk.Name, false);
    result = substituteMarker(result, '###USER###', pk.Username, false);
    result = substituteMarker(result, '###EMAIL###', pk.Email, false);

    // Write file
    fs.writeFile('db.sql', result, 'utf8', function(err) {
      if (err) {
        console.log(err);
      }

      // Read file again with changes
      fs.readFile('./db.sql', 'utf8', function(err, data) {
        // // Import sql file
        // connection.query(data, function(err, results) {
        //   connection.end();

        //   // Delete db.sql file after import
        //   fs.unlink('db.sql');

        //   return callback();
        // });
      });
    });
  });
}

function substituteMarker(content, marker, newContent, toString) {
  var regEx = new RegExp(marker, 'g');

  if (toString) {
    return content.toString().replace(regEx, newContent);
  } else {
    return content.replace(regEx, newContent);
  }
}
