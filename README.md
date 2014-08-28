Doctor Search
==============
Doctor Search is a simple Ruby on Rails app that uses a patient's address to search for nearby doctors, and ranks them by distance.

##Setup and Database Initialization##
After forking and cloning this repository, run `bundle install` from the terminal to install any missing our out of date gems. This application uses Sqlite3 as the database. To initialize the database, run `rake db:migrate`.
Seed data can be added to the database by running `rake db:seed`.

##Geocoding##
The ruby [Geocoder gem](https://github.com/alexreisner/geocoder) is used translate a doctor's address into latitude and longitude coordinates on creation. When a search is performed, the search address is similarly geocoded, then the 'near' method (a location-aware database query) is used to locate doctors within 5 miles of the address.
When performing this query, the Geocoder gem adds a 'distance' column to the results, which is used as the sort criteria.

##Testing##
Some basic model and feature tests are included, using RSpec and Capybara. To run the test suite, type `rspec` from the project's root directory. 
Test coverage analysis is provided by the [SimpleCov](https://github.com/colszowka/simplecov) gem.

##Front End##
On the front end, this application uses Javascript to show the search form when navigating to the search page, hide the form when a search is performed, display the results, and clear the input fields. An AJAX called is used to send the search request to the server and render the results.
Traditional Rails routing is used to navigate to the Doctor List page.

##Validation##
Minor validation is performed, including verifying that an address is provided before running a search, and displaying a message if no results are returned. Additionally, if more than 10 doctors are retrieved, a message appears prompting the user to select a specialty.
Though separate search boxes are provided for full address and zip code, they are interchangeable and either may be used. If information is supplied to both, the full address will receive higher precedence.

##Adding Data##
New doctors can be registered by navigating to the Doctor List page and clicking the 'Add new doctor' link. New specialties may only be created through a doctor, by adding a new doctor or updating an existing one.

##Styling##
Styling is provided by the Simplex Bootstrap theme from [bootswatch.com](http://bootswatch.com/simplex/). Some minor adjustments were made in local CSS files.