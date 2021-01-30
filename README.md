# README

# Dealerware Coding Exercise API

This project implements both the Primary and Advanced features outlined in the Dealerware Coding Exercise specs. I've included the Primary and Advanced API specs in the root of the project as well as the exercise description and instructions for reference.

## Clone the repository

```
git clone git@github.com:hayesmp/dw_ce_hayes_01272021.git
```

## Setting up the Rails app

Its a good to have a Ruby version manager, such as RVM or Rbenv installed first. This project is designed to run Ruby version `2.6.3`. If you don't have this version installed, you will need to install it with one of the above version managers.

Next install bundler:

```
gem install bundler
```

Then run:

```
bundle install
```

Next setup the database:

```
rails db:create
rails db:migrate
```

And run the seeds:

```
rails db:seed
```

Assuming no hiccups installing the gems you should be ready to start the server or run the tests.


## Running the tests

Simply run all the tests with:

```
rspec
```

## Running the server

Start the server with:

```
rails s
```

# Documentation

This project uses the rswag gem to generate api documentation. To view the api docs, run:

```
rails s
```

And then navigate to:

```
http://localhost:3000/api-docs/index.html
```

rswag generates the api documentation from the rswag api spec files in `rspec/requests/api/*`. If any changes are made, the docs can be updated by running:

```
rake rswag:specs:swaggerize
```
