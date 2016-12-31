# Rails Framework

After creating a dozen or so Ruby on Rails app, I realized I was using the same configuration over and over again. This boilerplate code is intended to simply save time building a Rails 5.0+ app.

## Getting Started

You'll need to do a few things to get up-and-running.  Here are a few items:

* Install all the necessary gems with ```bundle install```
* Modify ```config/database.yml``` with a new database name.
* Update your database with ```rails db:wipe```
* Start your web server with ```rails server:start```
* Create an account with [http://mailgun.com](http://mailgun.com) and update your SMPT data in ```config/environments/development.rb```.
* Change your ```ENV['SECRET_KEY_BASE']``` [Source](https://matt.aimonetti.net/posts/2013/11/30/sharing-rails-sessions-with-non-ruby-apps/)

---

#### Cliff's Notes

If you want to see an itemized list of modifications, I suggest reviewing the cliff notes within ```lib/tasks/app.rake```


#### OmniAuth Data

* [Facebook Info ID](https://developers.facebook.com/docs/graph-api/reference/user/)

---

# Managing Libraries

### Development Gems

- [Postgres](https://rubygems.org/gems/pg) for database
- [Dotenv](https://rubygems.org/gems/dotenv) for storing imporant data
- [Rerun](https://rubygems.org/gems/rerun/versions/0.11.0) watcher to help with automatic server restarts
- [Devise](https://rubygems.org/gems/devise) for user authentication
- [ERB to HAML](https://rubygems.org/gems/erb2haml) to convert Devise pre-packaged templates
- [High Voltage](https://rubygems.org/gems/high_voltage) for simple static pages
- [Font Awesome](https://rubygems.org/gems/font-awesome-rails) for icons
- [Simple Form](https://rubygems.org/gems/simple_form) for simplified forms
- [HAML](https://rubygems.org/gems/haml) (over ERB) for simplified HTML
- [SASS](https://rubygems.org/gems/sass-rails) for short-hand CSS
- [Bootstrap](https://rubygems.org/gems/bootstrap) for HTML + CSS templates


### Testing Gems

- [Populator](https://rubygems.org/gems/populator) and [Faker](https://rubygems.org/gems/faker) for creating fake data
- [Rspec](https://rubygems.org/gems/rspec) for testing
- [Factory girl](https://rubygems.org/gems/factory_girl_rails) for fake unit test data
- [Capybara](https://rubygems.org/gems/capybara) for automated user simulations


---


# Managing Tests

### Populating and Testing

Destroy and rebuild the test database with test data
```language-powerbash
rails db:wipe RAILS_ENV=test --trace
```

Migrate the test database
```language-powerbash
rails db:migrate RAILS_ENV=test --trace
```

Simply populate the test database with seed data. This is the alternative to ```fixtures```.
```language-powerbash
rails db:seed RAILS_ENV=test --trace
```

# Resources

* [How to configure Devise and OmniAuth](https://www.digitalocean.com/community/tutorials/how-to-configure-devise-and-omniauth-for-your-rails-application)
* [Javascript to Coffee](http://js2.coffee/)
* [HTML to HAML](http://htmltohaml.com/)
* [Devise AJAX Authentication](http://blog.andrewray.me/how-to-set-up-devise-ajax-authentication-with-rails-4-0/)

