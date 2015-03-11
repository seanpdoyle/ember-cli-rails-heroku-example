Deploying an ember-cli-rails App to Heroku
==========================================

For all changes, view this [commit diff][sha]

* Follow [ember-cli-rails](https://github.com/rwz/ember-cli-rails#readme) installation instructions
* Create your applicaiton on Heroku:

```bash
$ heroku create $MY_EMBER_CLI_RAILS_APP
```


* Tell Heroku that your app requires composing Multiple Build Packs

```bash
$ heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
```

* Check in `.buildpacks` to specify which buildpacks to use

```
https://github.com/heroku/heroku-buildpack-nodejs.git#v68
https://github.com/heroku/heroku-buildpack-ruby.git#v129
```

* Add `rails_12factor` to your `production` group in `Gemfile`, then run `bundle install`

```ruby
gem "rails_12factor", group: :production
```


* Add a `postinstall` task to your `ember-cli` app's `package.json`. This will
  ensure that during the deployment process, Heroku will all dependencies found
  in both `node_modules` and `bower_components`.

```json
{
  "devDependencies": {
    "bower": "*",
    ...
  }
  ...
  "scripts": {
    ...
    "postinstall": "node_modules/.bin/bower install"
  }
}
```

* Add a `package.json` to the root of your Rails project. This will be detected
  by the `nodejs` buildpack.

```json
{
  "cache_directories": ["frontend/node_modules", "frontend/bower_components"]
}
```

* Finally, deploy:

```bash
$ git push heroku master
```

[sha]: https://github.com/seanpdoyle/ember-cli-rails-heroku-example/commit/9bc829fc7a061dee879a2cf9b95e9f2b3ee92ec3
