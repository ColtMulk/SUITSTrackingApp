# SUITS Member Point Tracking

Requirements: Ruby 3.0.0, rails gem, pg gem, and postgresql set up on your machine
 
To set up on your local machine, first create a postgres user called suitsapp with:

```
createuser -P -d -e suitsapp   
```

and give it a password of 'suitsapp'. If you would like to use a different password, you will need to change the development password in SUITSApp/config/database.yml.

Next, create the database with:

```
createdb -U suitsapp suitsappdb
```

Finally navigate to the app:

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

and visiting http://127.0.0.1:3000. You should be taken to a list of users where you can create a new one to verify the db setup was successful.
