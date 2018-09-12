//
//  HomeTableViewCell.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var quoteLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
