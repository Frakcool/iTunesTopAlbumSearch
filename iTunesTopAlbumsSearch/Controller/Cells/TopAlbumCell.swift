//
//  TopAlbumCell.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/11/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

class TopAlbumCell: UITableViewCell {
	@IBOutlet weak var albumIcon: UIImageView!
	@IBOutlet weak var albumLabel: UILabel!
	@IBOutlet weak var artistLabel: UILabel!
	
	let service = ITunesService()
	
	func setup(album: AlbumResponse) {
		self.albumLabel.text = album.albumName
		self.artistLabel.text = album.artistName
		
		service.downloadImageFrom(urlString: album.imageUrl) { (imageData) in
			self.albumIcon.image = UIImage(data: imageData)
		}
	}
}
