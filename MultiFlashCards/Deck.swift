//
//  Deck.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/28/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

class Deck {
  
  private let cards: [Flashcard]
  
  // populate with some cards from Brainscape
  private let railsCardData = [
    "rails generate model ModelName" : "Creates a model with the specified model_name",
    "rails generate migration MigrationName" : "Creates a migration with the specified migration_name",
    "rails generate controller ControllerName" : "Creates a controller with the specified controller_name",
    "rails generate scaffold ModelName" : "Provides shortcut for creating your controller, model and view files in one step",
    "rails destroy scaffold ModelName" : "Destroys the created controller, model and view files that were generated for the given Model",
    "rails server" : "Starts ruby server at http://localhost:3000",
    "rails console" : "Opens the rails console for the current RAILS_ENV",
    "rake test:units" : "Runs all unit tests for the application",
    "rake -T" : "Lists all available rake tasks",
    "rake db:create" : "Creates the database defined in config/database.yml for the current RAILS_ENV",
    "rake db:migrate" : "Migrates teh database through scripts in the db/migrate directory",
    "rake db:drop" : "Drops the database for the current RAILS_ENV",
    "rake db:reset" : "Drops and recreates the database from db/schema.rb for the current environment",
    "rake db:rollback" : "Runs the down method from the latest migration",
    "rake doc:app" : "Builds the RDoc HTML files",
    "gem list" : "lists the gems that this rails application depends on",
    "gem server" : "Presents a web page at http://localhost:8808/ with info about installed gems",
    "bundle install" : "Installs all required gems for this application",
    "rake log:clear" : "Truncates all *.log files in log/ to zero bytes",
    "rake routes" : "Prints out all teh defined routes in match order with names",
    "rake tmp:clear" : "Clears session, cache and socket files from tmp/",
    "rake test:benchmark" : "Benchmarks your application"
  ]
  
  // populate with some cards from Prof. H
  private let rubyCardData = [
    "<array>.map" : "Creates a new array containing the values returned by the block",
    "<array>.empty?" : "Returns true if self contains no elements",
    "<array>.sample" : "Choose a random element or n random elements from the array",
    "<array>.shuffle" : "Returns a new array with elements of self shuffled",
    "<int>.odd?" : "Returns true if the int is an odd number",
    "<int>.next" : "Returns the Integer equal to int + 1",
    "<num>.zero?" : "Returns true if num has a zero value",
    "<num>.truncate" : "Returns num truncated to an Integer",
    "<string>.downcase" : "Downcases the contents of str, returning nil if no changes were made",
    "<string>.length" : "Returns the character length of str",
    "<string>.include?(str2)" : "Returns true if string contains the given string or character str2",
    "<string>.to_f" : "Returns the result of interpreting leading characters in string as a floating point number",
    "<string>.empty?" : "Returns true if str has a length of zero",
    "<hash>.clear" : "Removes all key-value pairs from hash",
    "<hash>.flatten" : "Returns a new array that is a one-dimensional flattening of this hash",
    "<hash>.size" : "Returns the number of key-value pairs in the hash"
  ]
  
  // Method to draw a random card...
  func drawRandomCard() -> Flashcard? {
    if cards.isEmpty {  // shouldn't ever really be an issue; just being safe...
      return nil
    } else {
      return cards[Int(arc4random_uniform(UInt32(cards.count)))]
    }
  }
  
  init(choice: String) {
    // put this data into cards and add the cards to the deck
    var cardData: Dictionary = [String : String]()
    if choice == "rails" {
      cardData = railsCardData
    } else {
      cardData = rubyCardData
    }
    
    cards = cardData.map { Flashcard(term: $0, definition: $1) }
  }
  
}