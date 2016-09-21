//
//  SearchController.swift
//  MultiFlashCards
//
//  Created by Larry Heimann on 9/30/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  
  var flashcard: Flashcard?
  let baseSearchURL = "https://google.com/search?q="
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let card = flashcard,
      escapedURLString = searchURLString(baseSearchURL, term: card.term),
      url = NSURL(string: escapedURLString) {
        webView.loadRequest(NSURLRequest(URL: url))
    }
  }
  
  private func searchURLString(base: String, term: String) -> String? {
    return "\(baseSearchURL) \(term)"
      .stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
  }

}
