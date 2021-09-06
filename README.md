# README

In order to start the app, go to main
To run migration and create database:
rails db:migrate
To run seeds and generate data:
rails db:seed
To run the test that tests if transfer found works:
rspec spec/requests/transfers_spec.rb

There are two rest endpoints, one is used to transfer founds between two accounts and the other one is used to bring last 10 transactions of an account:
post '/transfers' - expects these parameters: :transferor_id, :transferee_id, :amount, :execution_date
get '/accounts/:id' - expects id as a parameter
