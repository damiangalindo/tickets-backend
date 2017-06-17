source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'aasm', '~> 4.11'
gem 'annotate'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'simple_token_authentication'
gem 'jbuilder', '~> 2.5'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-entity',
    git: 'https://github.com/ruby-grape/grape-swagger-entity.git', tag: 'v0.1.4'
gem 'grape-swagger-rails'
gem 'grape-swagger-representable'
gem 'okcomputer', '~> 1.14', '>= 1.14.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'rack-cors', '~> 0.4.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bullet', '5.1.0'
  # Adds support for Capybara system testing and selenium driver
  gem 'apivore'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'pry-rails', '0.3.4'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'json_spec', '~> 1.1', '>= 1.1.4'
  gem 'launchy'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'simplecov', '~> 0.11.2'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
