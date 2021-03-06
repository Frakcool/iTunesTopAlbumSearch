//
//  DetailsViewController.swift
//  iTunesTopAlbumsSearch
//
//  Created by Jesus Sanchez on 12/13/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var albumIcon: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    
    var album: AlbumResponse?
	let service = ITunesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		service.downloadImageFrom(urlString: album!.imageUrl) { (imageData) in
			self.albumIcon.image = UIImage(data: imageData)
		}
        albumNameLabel.text = "Album: \(album!.albumName)"
        artistNameLabel.text = "Artist: \(album!.artistName)"
        categoryLabel.text = "Category: \(album!.category)"
        priceLabel.text = "Price: \(album!.price)"
		setFavorite(isUserSelected: false)
    }
    
    @IBAction func toggleFavorite(_ sender: Any) {
		setFavorite(isUserSelected: true)
    }
	
	func setFavorite(isUserSelected: Bool) {
		if isUserSelected {
            album?.isFavorite = !(album!.isFavorite)
		}
		
		if album!.isFavorite {
			favoriteIcon.setImage(UIImage(named: "favorite"), for: .normal)
			favoriteIcon.setTitle("   Favorite", for: .normal)
		} else {
			favoriteIcon.setImage(UIImage(named: "unfavorite"), for: .normal)
			favoriteIcon.setTitle("Unfavorite", for: .normal)
		}
	}
}
