source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# ## -- SYSTEM  -- ##
ruby '2.4.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.5'

# ## -- FRONT END -- ##
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# ## -- OTHER GEMS -- ##
gem 'active_model_serializers'
gem 'annotate'
gem 'api-pagination'
gem 'pager_api'
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rspec_api_documentation'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
