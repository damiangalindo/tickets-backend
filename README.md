## Ticket System Front-End
#
> Developed By: Damian Galindo
#
This is a system to manage tickets
## Setting up
To setup the application you have to follow this steps
## Install Gems
From the terminal, go to the project folder and enter `bundle install`, this
command will install all the gems for the project
## Database
First, you have to copy the database.yml file, you can do this entering the
following command in the terminal
`$: cp config/database.example.yml config/database.yml`
After doing this, you have to run
`rails db:create` to create the database
`rails db:migrate` to migrate the database
`rails db:seed` to add the Admin user to the app
## Tests
This application is using rspec as the test suite, so to run the tests you have to
enter in the terminal
`$: rspec spec`
Ticket System Front-End
Developed By: Damian Galindo
This is a system to manage tickets

Setting up
To setup the application you have to follow this steps

Install Gems
From the terminal, go to the project folder and enter bundle install, this command will install all the gems for the project

Database
First, you have to copy the database.yml file, you can do this entering the following command in the terminal

$: cp config/database.example.yml config/database.yml

After doing this, you have to run

rails db:create to create the database
rails db:migrate to migrate the database
rails db:seed to add the Admin user to the app

Tests
This application is using rspec as the test suite, so to run the tests you have to enter in the terminal

$: rspec spec
