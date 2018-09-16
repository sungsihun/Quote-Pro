//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

protocol QuoteBuilderDelegate {
  func saveQuote(quote: Quote)
}

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var quoteViewImageView: UIImageView!
    @IBOutlet weak var quoteView: QuoteView!
  
    var delegate: QuoteBuilderDelegate?
    var quoteText: String = ""
    var nameText: String = ""
    var image: UIImage?
    var quote: Quote?
  
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      quoteView.quoteViewLabel.text = ""
      getImage()
    }

    //MARK: Button Action
  
    @IBAction func quoteButtonTapped(_ sender: UIButton) {
      getQuote {
        // When from background thread, UI needs to be updated on main_queue
        DispatchQueue.main.async {
          self.quoteText = "\"" + self.quoteText + "\"\n\n" + self.nameText
          self.quoteView.quoteViewLabel.text = self.quoteText
        }
      }
    }
  
    @IBAction func imageButtonTapped(_ sender: UIButton) {
      getImage ()
    }
  
  
    func getQuote(completion: @escaping() -> Void) {
      
      // Start background thread so that image loading does not make app unresponsive
      DispatchQueue.global(qos: .userInitiated).async {
        
        guard let endpointUrl = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else {return}
        
        var urlRequest = URLRequest(url: endpointUrl)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
          guard let dataResponse = data,
            error == nil else {
              print(error?.localizedDescription ?? "Response Error")
              return }
          do{
            //here dataResponse received from a network request
            let jsonResponse = try JSONSerialization.jsonObject(with:
              dataResponse, options: [])
            
            guard let jsonArray = jsonResponse as? [String: Any] else {
              return
            }
            
            //Now get quote value
            guard let quoteText = jsonArray["quoteText"] as? String else { return }
            guard let nameText = jsonArray["quoteAuthor"] as? String else { return }

            self.quoteText = quoteText
            self.nameText = nameText
            completion()

          } catch let parsingError {
            print("Error", parsingError)
          }
        }
        task.resume()
      }
    }
  
  
  
    func getImage() {
      let imageUrlString = "https://picsum.photos/g/200/300/?random"
      let imageUrl:URL = URL(string: imageUrlString)!

      // Start background thread so that image loading does not make app unresponsive
      DispatchQueue.global(qos: .userInitiated).async {

        let imageData:NSData = NSData(contentsOf: imageUrl)!
        DispatchQueue.main.async {
          let image = UIImage(data: imageData as Data)
          self.quoteView.quoteViewImageView.image = image
        }
      }
    }
  
    //MARK: Navigation
  
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
  
  
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
      let snapshot = quoteView.snapshotImage()
      self.quote = Quote(name: self.nameText, quote: self.quoteText, image: snapshot!)
      delegate!.saveQuote(quote: self.quote!)
      navigationController?.popViewController(animated: true)
    }
  
}

public extension UIView {
    public func snapshotImage() -> UIImage? {
      UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
      drawHierarchy(in: bounds, afterScreenUpdates: false)
      let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return snapshotImage
    }
  
    public func snapshotView() -> UIView? {
      if let snapshotImage = snapshotImage() {
        return UIImageView(image: snapshotImage)
      } else {
        return nil
      }
    }
}

