source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

#for safty
gem "figaro"

#font awsome
gem "font-awesome-rails"

#meta tag
gem 'meta-tags-helpers', '~> 0.2.0'

# MailChimp for mailer
gem 'gibbon'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'foundation-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "letter_opener"
  gem 'sqlite3', '1.3.9'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
end

group :production do
  gem 'pg', '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'puma', '2.11.1'
end
