# International-Students-Portal

# To make yourself system administrator in local host:
```sh
$ rails c
# Find your user and assign it to a variable such as:
> u = u.first

# Now set appropriate columns
> u.approved = true
> u.save
> u.admin = true
> u.save
> u.system_admin = true
> u.save
```

# To make yourself system admin on Heroku (Heroku pipeline access required)
``` sh
$ heroku console # This may not work or time out if your network is blocking certain ports

# Find your user and assign it to a variable such as:
> u = u.first

# Now set appropriate columns
> u.approved = true
> u.save
> u.admin = true
> u.save
> u.system_admin = true
> u.save 
```

# If CSS is working on localhost but not Heroku, try:
```sh
$ bundle exec rake assets:precompile
```
# To manulaly migrate local database changes, try:
```sh
$ heroku run rake db:migrate
```


 # To manulaly migrate local database changes, try:
```sh
$  heroku run:detached rake db:migrate
```

## Running Locally

Use RVM to install correct Ruby and Rails version.  Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/).

```sh
$ git clone git@github.com:heroku/ruby-getting-started.git
$ cd ruby-getting-started
$ bundle install
$ bundle exec rake db:create db:migrate
$ heroku local
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

or

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Docker

The app can be run and tested using the [Heroku Docker CLI plugin](https://devcenter.heroku.com/articles/local-development-with-docker-compose).

Make sure the plugin is installed:

    heroku plugins:install heroku-docker

Configure Docker and Docker Compose:

    heroku docker:init

And run the app locally:

    docker-compose up web

The app will now be available on the Docker daemon IP on port 8080.

To work with the local database and do migrations, you can open a shell:

    docker-compose run shell
    bundle exec rake db:migrate

You can also use Docker to release to Heroku:

    heroku create
    heroku docker:release
    heroku open

## Documentation

For more documentation related to International Students Portal see:

- [International Students Portal Documentation](https://international-students-portal.herokuapp.com/)

For more information about using Ruby on Heroku, see these Dev Center articles:

- [Ruby on Heroku](https://devcenter.heroku.com/categories/ruby)
JSFiddle: https://jsfiddle.net/azdb1ub9/ 
