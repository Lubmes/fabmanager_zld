source 'http://rubygems.org/'
ruby "2.3.3"

gem 'rails', '~> 5.0.0.1'
# if Gem.win_platform?
  gem 'sqlite3', group: [:development, :test]
# else
  #gem 'pg', '~> 0.19.0', group: [:development, :test]
#end
gem 'pg', '~> 0.19.0', group: :production
gem 'puma', '~> 3.6'
gem 'sass-rails', '~> 5.0.6'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2.1'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'simple_form'
gem 'devise', '~> 4.2'
gem 'font-awesome-rails', '~> 4.6', '>= 4.6.3.1'
gem 'pundit', '~> 1.1'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'coffee-script-source', '1.8.0'
gem 'paperclip', '~> 5.1.0'
gem 'rails-simple-search'
#Bcrypt gets many errors when you bundle it
gem 'bcrypt', '~> 3.1.7', platforms: :ruby
gem 'icalendar', '~> 2.4', '>= 2.4.1'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'gmaps4rails'
#Redcarpet Markdown.
gem 'redcarpet'
# bootstrap
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'figaro'
gem 'acts_as_votable', '~> 0.10'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5', '>= 3.5.1'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-database-yml', '~> 1.0', '>= 1.0.1'
  gem 'capistrano-secrets-yml', '~> 1.0'
end

group :test do
  gem "capybara", "~> 2.4"
  gem 'factory_girl_rails', '~> 4.7'
  gem "selenium-webdriver", "~> 2.45"
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem "email_spec", "~> 1.6.0"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
