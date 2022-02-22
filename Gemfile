source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

gem 'apollo_upload_server', '2.1.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'faraday-http-cache', '~> 2.2.0'
gem 'google-cloud-storage', '~> 1.36'
gem 'graphql', '~>1.13.8'
gem 'jwt', '~>2.3.0'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.6.2'
gem 'rack-cors'
gem 'stripe'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'dotenv-rails'
  gem 'graphiql-rails'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
