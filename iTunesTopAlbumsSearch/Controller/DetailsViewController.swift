//
//  DetailsViewController.swift
//  iTunesTopAlbumsSearch
//
//  Created by Jesus Sanchez on 12/13/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    var albumName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = albumName
    }
    
//    @IBAction func backButtonPressed(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
}
