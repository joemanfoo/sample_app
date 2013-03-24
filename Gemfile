source 'https://rubygems.org'

group :production do
	ruby "1.9.3"
end

gem 'rails', '3.2.8'
gem 'bootstrap-sass'
#gem 'will_paginate' # at 3.1 will have mogoid support
#  untill then...
gem 'will_paginate_mongoid'


gem 'bootstrap-will_paginate'

gem 'mongoid', '~> 3.1.0'
gem 'faker'

group :development, :test do
	gem 'rspec-rails', '2.9.0'
	#gem 'guard-rspec', '0.5.5'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
	gem 'rspec-rails', '2.9.0'
	gem 'capybara', '1.1.2'
	gem 'rb-fchange', '0.0.5'
	gem 'rb-notifu', '0.0.4'
	gem 'win32console', '1.3.0'
	gem 'wdm', '~> 0.1'
	#gem 'guard-spork'
	gem 'spork', '0.9.0'
	gem 'childprocess', '~> 0.3.6'
	gem 'database_cleaner'
	gem 'factory_girl_rails', '1.4.0'
	gem 'cucumber-rails'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.1'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
