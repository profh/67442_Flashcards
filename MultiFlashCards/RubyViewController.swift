//
//  SecondViewController.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/28/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class RubyViewController: UIViewController {

  // create an outlet to display commands
  @IBOutlet weak var methodLabel: UILabel!
  
  // create a new deck and a var to hold a flashcard from that deck
  let deck = Deck(choice: "ruby")
  var flashcard: Flashcard?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // because we really want a new card every time this view appears
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let flashcard = deck.drawRandomCard() {
      self.flashcard = flashcard
      methodLabel.text = flashcard.term
    }
  }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "showDefinitionRuby" {
        let showDefinitionRuby:DefinitionViewController = segue.destinationViewController as! DefinitionViewController
        showDefinitionRuby.flashcard = self.flashcard
      }
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

