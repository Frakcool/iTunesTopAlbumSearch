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
	
	init(albumName: String, artistName: String, imageUrl: String) {
		self.albumName = albumName
		self.artistName = artistName
		self.imageUrl = imageUrl
	}
}
