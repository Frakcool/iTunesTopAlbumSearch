//
//  AlbumResponse.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/12/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import Foundation

class AlbumResponse {
	var albumName: String
	var artistName: String
	var imageUrl: String
    var category: String
    var price: String
    var isFavorite: Bool
	
    init(albumName: String, artistName: String, imageUrl: String, category: String, price: String, isFavorite: Bool) {
		self.albumName = albumName
		self.artistName = artistName
		self.imageUrl = imageUrl
        self.category = category
        self.price = price
        self.isFavorite = isFavorite
	}
}
