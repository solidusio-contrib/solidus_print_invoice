source "https://rubygems.org"

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem "solidus", github: "solidusio/solidus", branch: branch
gem "solidus_auth_devise"

if branch == 'master' || branch >= "v2.0"
  gem "rails-controller-testing", group: :test
  gem 'rails', '~> 5.0.0' # hack for broken bundler dependency resolution
else
  gem "rails_test_params_backport"
  gem "rails", "~> 4.2.7"
end

gem 'pg'
gem 'mysql2'

group :development, :test do
  gem "pry-rails"
end

gemspec
