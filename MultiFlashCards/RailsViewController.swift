//
//  FirstViewController.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/28/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class RailsViewController: UIViewController {

  // create an outlet to display commands
  @IBOutlet weak var commandLabel: UILabel!
  
  // create a new deck and a var to hold a flashcard from that deck
  let deck = Deck(choice: "rails")
  var flashcard: Flashcard?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // because we really want a new card every time this view appears
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    if let flashcard = deck.drawRandomCard() {
      self.flashcard = flashcard
      commandLabel.text = flashcard.term
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDefinition" {
      let showDefinition:DefinitionViewController = segue.destinationViewController as! DefinitionViewController
      showDefinition.flashcard = self.flashcard
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

