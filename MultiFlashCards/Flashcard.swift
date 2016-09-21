//
//  Flashcard.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/28/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

struct Flashcard {
  
  let term: String
  let definition: String
  
  init(term: String, definition: String) {
    self.term = term
    self.definition = definition
  }
  
}