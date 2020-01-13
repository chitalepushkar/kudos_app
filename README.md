# Kudos app

An app to give Kudos to team members within the logged in user's organization.

## Requirements

Ruby(>=2.5.0), MySQL(>=5.5.8 and < 8.0), Yarn

## Installation

### Steps

* Refer following guide for installing ruby, mysql and rails: https://gorails.com/setup/osx/10.15-catalina

* Yarn install: https://yarnpkg.com/lang/en/docs/install/#mac-stable

* Clone repository
  ```ruby
  git clone https://github.com/chitalepushkar/kudos_app.git
  ```

* Run following commands:

  * Add bootstrap and related js packages using yarn.
    ```ruby
    yarn add bootstrap jquery popper.js # Install bootstrap and related js packages
    ```

  * Install ruby gem dependencies.
    ```ruby
    bundle install
    ```

* MySQL configuration

  * Create mysql user for the app by first opening mysql with root and then adding a new user.
    ```mysql
    mysql -u root -p # Login using root user from console

    mysql> GRANT ALL PRIVILEGES ON *.* TO 'kudos_user'@'localhost' IDENTIFIED BY 'password';
    ```

  * Modify mysql host and port in config/database.yml or keep below mentioned changes if your mysql is running on localhost on port 3306.
    ```ruby
    default: &default
      adapter: mysql2
      encoding: utf8mb4
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: kudos_user
      password: password
      host: localhost
      port: 3306
    ```
* Create database
  ```ruby
  rake db:create
  ```
  Above command will create 2 databases viz. kudos_app_development and kudos_app_test.

* Run migration to create tables.
  ```ruby
  rake db:migrate
  ```
  Above command will create 3 tables viz. organizations, users and kudos_recipients.

* Seed dummy data.
  ```ruby
  rake db:seed
  ```
  In order to generate dummy users, organizations and kudos, run above command.

## Usage

* Start the rails application on port 3000 by typing the following command in your console.
  ```ruby
  rails s -p 3000
  ```

* In order to login using any of the dummy user created by the `rake db:seed` command, visit the following page to view list of available users along with their username and password.
`http://localhost:3000/users`
