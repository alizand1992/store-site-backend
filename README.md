# Store: Service

## Features:
* Utilizes ActiveStorage for file storage
  * Flexible source storage
  * Flexible mirroring
* Auto Thumbnail generator based on "attract" property of the selected/default image
* User management:
  * Devise
  * Devise-jwt
  * Whitelist strategy
* Custom Attributes

## Future Goals:
* Add inventory management
* Create setup wizard to setup initial admin user, etc...
* Add Shopping Card

## Requirements:
* MRI Ruby 2.6.6 (RVM is preferred)
* bundler
* SQLite3 - It will come with Rails. No setup is required for development.
* **Note:** This documentation is for Ubuntu 20.04 LTS. This should also work on Windows or OSX but it has not been 
verified.   

## General Setup:
1. Clone the repository on your disk
1. `cd path/to/directory`
1. `bundle install`
1. `rails db:migrate`
1. `rails s -p 5000` Run puma on port 5000.

## Notes:
* Port 5000 is used in this guide since `Store: Site` uses that port to communicate with the backend
* There are no default admin users in the database. You may use postman for now to make a POST request. 
* Secret key should use environment variables. It has been hard coded at the moment to speed up setup/development.

## Test:
This uses RSpec for testing:
* `bundle exec rspec` to run all tests
* `bundle exec rspec path/to/file_spec.rb` to run a specific file

This uses Travis CI:
* With the current setup any push on master will trigger a build

## Configuration:
* TODO

## Services (job queues, cache servers, search engines, etc.):
* TODO

## Deployment instructions
* TODO

## Author:
Computer Engineering BS from San Jose State University.

On my free time I code and Read about computers.

Follow [@ali_the_coder](https://twitter.com/ali_the_coder) on Twitter