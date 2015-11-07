Deploying an ember-cli-rails App to Heroku
==========================================

* Follow [ember-cli-rails][heroku] installation instructions
* Create your applicaiton on Heroku:

```bash
$ heroku create $MY_EMBER_CLI_RAILS_APP
```

To configure your Ember CLI Rails app to be ready to deploy on Heroku:

1. Run `rails g ember-cli:heroku` generator
1. [Add the NodeJS buildpack][buildpack] and configure NPM to include the
   `bower` dependency's executable file.

```sh
$ heroku buildpacks:clear
$ heroku buildpacks:add --index 1 https://github.com/heroku/heroku-buildpack-nodejs
$ heroku buildpacks:add --index 2 https://github.com/heroku/heroku-buildpack-ruby
$ heroku config:set NPM_CONFIG_PRODUCTION=false
$ heroku config:unset SKIP_EMBER
```

You should be ready to deploy.

**NOTE** Run the generator each time you introduce additional EmberCLI
applications into the project.

[heroku]: https://github.com/thoughtbot/ember-cli-rails#heroku
[buildpack]: https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app#adding-a-buildpack
