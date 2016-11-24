# Rails Framework

After creating a dozen or so Ruby on Rails app, I realized I was using the same configuration over and over again. This boilerplate code is intended to simply save time building a Rails 5.0+ app.


#### Cliffs Notes

If you want to see an itemized list of modifications, I suggest reviewing the cliff notes within ```lib/tasks/app.rake```

### Development Gems

- Dotenv for storing imporant data
- Rerun watcher to help with automatic server restarts
- Devise for user authentication
- ERB to HAML to convert Devise pre-packaged templates
- High Voltage for simple static pages
- Font Awesome for icons
- Simple Form for simplified forms
- HAML (over ERB) for simplified HTML
- SASS for short-hand CSS
- Bootstrap for HTML + CSS templates


### Testing Gems

- Populator and Faker for creating fake data
- Rspec for testing
- Factory girl for fake unit test data
- Capybara for automated user simulations


---


# Managing Local Server

Start server with Rerun watching important files
```language-powerbash
rails server:start
```


# Managing Local Database

Completely destroy a database and re-build it with seed data
```language-powerbash
rails db:wipe
```

---

# Tests

### Populating and Testing


```language-powerbash
rails db:wipe RAILS_ENV=test --trace
```

```language-powerbash
rails db:migrate RAILS_ENV=test --trace
```

```language-powerbash
rails db:seed RAILS_ENV=test --trace
```


