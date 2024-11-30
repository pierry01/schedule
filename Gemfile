source "https://rubygems.org"

gem "rails", "7.2.2"
gem "sprockets-rails", "3.5.2"
gem "sqlite3", "2.3.1"
gem "puma", "6.5.0"
gem "importmap-rails", "2.0.3"
gem "turbo-rails", "2.0.11"
gem "stimulus-rails", "1.3.4"
gem "jbuilder", "2.13.0"
gem "bootsnap", "1.18.4", require: false
gem "tailwindcss-rails", "3.0.0"

group :development, :test do
  gem "debug", "1.9.2", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", "6.2.2", require: false
  gem "rubocop-rails-omakase", "1.0.0", require: false
end

group :development do
  gem "web-console", "4.2.1"
end

group :test do
  gem "capybara", "3.40.0"
  gem "selenium-webdriver", "4.27.0"
end

gem "tzinfo-data", platforms: %i[ windows jruby ]