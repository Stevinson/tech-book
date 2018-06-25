# Rails

### Setup

* `gem install rails -v 5.0.5`

  Install rails

* To Set up a nice front-end:

* ```gem &quot;bootstrap-sass&quot;
  gem "bootstrap-sass"
  gem "font-awesome-sass"
  gem "simple_form"
  gem "autoprefixer-rails"
  ```

  ```
  bundle install
  rails generate simple_form:install —bootstrap
  ```

* To set up the Le Wagon CSS file organisation:

* To set up a file to save secret keys:

```
// In the gemfile
gem 'figaro'
// In the terminal
bundle install
bundle bistubs figaro
figaro install
spring stop
```
