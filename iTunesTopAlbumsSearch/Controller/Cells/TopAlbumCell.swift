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
	
	func setup() {
		self.albumLabel.text = "Album"
		self.artistLabel.text = "Artist"
	}
}
