source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'active_model_serializers'

gem "google-protobuf", '>=3.7.0.rc.2'

gem "anycable-rails"

gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

gem "figaro"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:ruby, :ruby_18, :ruby_19, :ruby_20, :ruby_21, :ruby_22, :ruby_23, :ruby_24, :ruby_25, :mri, :mri_18, :mri_19, :mri_20, :mri_21, :mri_22, :mri_23, :mri_24, :mri_25, :rbx, :jruby, :jruby_18, :jruby_19, :mswin, :mswin_18, :mswin_19, :mswin_20, :mswin_21, :mswin_22, :mswin_23, :mswin_24, :mswin_25, :mswin64, :mswin64_19, :mswin64_20, :mswin64_21, :mswin64_22, :mswin64_23, :mswin64_24, :mswin64_25, :mingw, :mingw_18, :mingw_19, :mingw_20, :mingw_21, :mingw_22, :mingw_23, :mingw_24, :mingw_25, :x64_mingw, :x64_mingw_20, :x64_mingw_21, :x64_mingw_22, :x64_mingw_23, :x64_mingw_24, :x64_mingw_25]

gem "jwt", "~> 2.1"
