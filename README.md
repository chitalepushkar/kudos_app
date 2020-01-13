# Kudos app

An app to give Kudos to team members within the logged in user's organization.

## Requirements

Ruby(>=2.5.0), MySQL(>=5.5.8 and < 8.0), Yarn

## Installation

### Steps

* Refer following guide for installing ruby, MySQL and rails: https://gorails.com/setup/osx/10.15-catalina

* Yarn install: https://yarnpkg.com/lang/en/docs/install/#mac-stable

* Clone repository
  ```ruby
  git clone https://github.com/chitalepushkar/kudos_app.git
  ```

* Run following commands:

  * Run yarn command to install necessary js packages.
    ```ruby
    yarn
    ```

  * Install ruby gem dependencies.
    ```ruby
    bundle install
    ```

* MySQL configuration

  * Create MySQL user for the app by first opening MySQL console with root and then adding a new user.
    ```mysql
    mysql -u root -p # Login using root user from console

    mysql> CREATE USER 'kudos_user'@'localhost' IDENTIFIED BY 'password';
    mysql> GRANT ALL PRIVILEGES ON *.* TO 'kudos_user'@'localhost';
    ```
    Note: If you want to use an existing MySQL user instead of creating `kudos_user`, you can change credentials to connect the rails app with your MySQL setup by modifying the config/database.yml file.

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
