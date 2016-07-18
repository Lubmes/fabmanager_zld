# README

To manage a FabLab: 
to operate more efficient, 
to keep oversight of all the things being made, 
to educate and improve useabilty.

Build:

* Ruby 2.3.0

* Rails 5.0.0

* Postgres

* Styling with W3.CSS & simple form.

* RSpec, FactoryGirl and Capybara are used for testing. BDD building style approach. 

* Configurated to use NL (Dutch) as the default local (in config/application.rb)

# Styling

Styling is done with the css-only library W3.CSS found in a single file: lib/assets/stylesheets/w3.css.
This is done to make the styling as lightweight as possible, so others can easily apply their own style. 
Mind the simple_form config file (config/initializers/simle_form.rb). There you can easily adjust the forms their style classes, ids and the shape of errors.