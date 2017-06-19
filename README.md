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
## Starting the app
This application is using foreman, and is configured to start using the port 3001
To start the application you have to type `$: foreman start` in the terminal and then
type in the browser `http://localhost:3001`

## Admin
This application is using active admin to manage the information, so after starting the
application you have to go to `http://localhost:3001/admin/login`,
type `admin@example.com` in the email
and `password` in the password

## Apidoc
This application is using swagger for documentation, so after starting the app,
you can type `http://localhost:3001/apidoc` in the browser, and it will take you to the sandbox page

# ENV

You must create a `.env`, you can use the `.env.example` as a guide,
for the `SWAGGER_BASE_PATH` it should use the same one as the one the application is using,

## Tests
This application is using rspec as the test suite, so to run the tests you have to
enter in the terminal
`$: rspec spec`
Ticket System Front-End
Developed By: Damian Galindo
This is a system to manage tickets
