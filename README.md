# SUITS Member Point Tracking

For MacOS:

Requirements: Ruby 2.7.2, rails gem, pg gem, and postgresql set up on your machinee

 
To set up on your local machine, first create a postgres database with

```
createdb -U suitsapp suitsappdb
```

Navigate to the app:

```
cd SUITSApp  
```

and run the database migration:

```
rake db:migrate
```

Check to ensure everything worked by starting the rails server:

```
rails server
```

and visiting http://127.0.0.1:3000

For Unix:

```
first mess with the database.yml in default if not there
username: postgres
password: postgres
host: localhost
port: 5432
```
```
sudo service postgresql start
```
```
$ sudo -u postgres createuser <username>   
```
```
$ sudo -u postgres createdb <dbname> 
```
```
$ sudo -u postgres psql
```
```
psql=# alter user <username> with encrypted password '<password>';
```
```
psql=# grant all privileges on database <dbname> to <username> ;
```
```
psql=# \q; to quit or exit server
```
```
rails db:setup
```
```
rails db:migrate
```
```
bundle install
```
```
rails server
```
```
rails webpacker:install (if webpacker error run this command)
```

Deploy to Heroku:

Pushing changes to the master branch will automatically deploy to the staging app in https://dashboard.heroku.com/pipelines/880b5af4-f7e3-48c5-a568-11b23e2b3e04
- This lets you test the changes before deploying to production

In order to deploy to production app you will go to https://dashboard.heroku.com/apps/suits-point-tracking/deploy/github, scroll down to manual deploy, and click deploy branch with master selected

If you add any new database migrations, you will need to migrate the database on heroku.
- to do this click More in the top right corner then click run console. There you will type:

```
rails db:migrate
```

and allow it to run

Github Actions:

Whenever a change is made, 2 github actions will automatically run on the changed code, rubocop and rspec. Rubocop checks that your code adheres to ruby coding standards, and rspec runs the testing suite.

The testing suite is found in SUITSApp/spec