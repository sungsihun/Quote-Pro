//
//  Quote.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class Quote: NSObject {
  var name: String
  var quote: String
  var image: UIImage
  
  init?(name: String, quote: String, image: UIImage) {
    self.name = name
    self.quote = quote
    self.image = image
  }
}
