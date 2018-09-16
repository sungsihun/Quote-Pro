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
      
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTapped))
    }
  
    @objc func addTapped() {

        let imageToShare = [self.previewImage!]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

}
