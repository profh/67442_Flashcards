//
//  DefinitionViewController.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/28/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

  @IBOutlet weak var termLabel: UILabel!
  @IBOutlet weak var definitionLabel: UILabel!
  
  var flashcard: Flashcard?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // we need to safely unpack the flashcard and display the data, if present
    if let card = flashcard {
      termLabel.text = card.term
      definitionLabel.text = card.definition
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "searchForTerm" {
      let searchForTerm:SearchController = segue.destinationViewController as! SearchController
      searchForTerm.flashcard = self.flashcard
    }
  }

}
