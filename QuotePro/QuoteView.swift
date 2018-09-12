//
//  QuoteView.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class QuoteView: UIView {

  @IBOutlet weak var quoteViewLabel: UILabel!
  @IBOutlet weak var quoteViewImageView: UIImageView!
  @IBOutlet var contentView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupWithQuote()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupWithQuote()
  }
  
  private func setupWithQuote() {
    Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)
    addSubview(contentView)
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }

}
