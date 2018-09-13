//
//  HomeViewController.swift
//  QuotePro
//
//  Created by NICE on 2018-09-12.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, QuoteBuilderDelegate {
  
//  @IBOutlet weak var quoteView: QuoteView!
  @IBOutlet weak var tb: UITableView!
  @IBOutlet weak var addButton: UIBarButtonItem!
  
  var quotes = [Quote]()
  var currentImage: UIImage?
  
  override func viewDidLoad() {
      super.viewDidLoad()
//      quoteView.quoteViewLabel.text = "test"
//      let snapshot = quoteView.snapshotView(afterScreenUpdates: true)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
      self.tb.reloadData()
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  
    //MARK: TableView Data Source
  
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return quotes.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
      
      let quote = quotes[indexPath.row]

      cell.quoteLabel.text = quote.quote
      cell.nameLabel.text = quote.name
      return cell
    }
  

  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let destination = segue.destination as? QuoteBuilderViewController {
        destination.delegate = self
      }
    if let index: IndexPath = tb.indexPathForSelectedRow {

      if segue.identifier == "previewSegue" {
        let previewVC = segue.destination as? PreviewViewController
        previewVC?.previewImage = self.quotes[index.row].image
      }
    }
    
    
    
  }
  
  func saveQuote(quote: Quote) {
    self.quotes.append(quote)
  }
  
}



