//
//  PreviewViewController.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

  @IBOutlet weak var previewImageView: UIImageView!
  
  var previewImage: UIImage?
  
  override func viewDidLoad() {
        super.viewDidLoad()
        previewImageView.image = previewImage
//        previewImageView = UIImageView()
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
