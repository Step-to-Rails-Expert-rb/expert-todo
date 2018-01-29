source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Fixed order
gem "rails", "~> 5.1.3"

# Alphabetical order
gem "devise"
gem "devise-i18n"
gem "jbuilder", "~> 2.5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "pry-byebug"
  gem 'pry-doc'
  gem 'pry-rails'
end

group :development do
  gem "annotate"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "rspec-rails"
end
