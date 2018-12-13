//
//  ITunesService.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/12/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias AlbumsSuccess = ([AlbumResponse]) -> ()
typealias AlbumsFailure = () -> ()

class ITunesService {
	var success: AlbumsSuccess!
	var failure: AlbumsFailure!
	
	func downloadTopAlbums(number: Int) {
		let urlString = "http://itunes.apple.com/us/rss/topalbums/limit=\(number)/json"
		
		guard let url = URL(string: urlString) else {
			return
		}
		
        Alamofire.request(url).responseJSON(queue: DispatchQueue.global(), options: .mutableLeaves) { response in
			let json = JSON(rawValue: response.result.value!)!
			
			var albums: [AlbumResponse] = []

			let entries = json["feed"]["entry"].array!

			for entry in entries {
				let albumName = entry["im:name"]["label"].string!
				let artistName = entry["im:artist"]["label"].string!
				if let imageUrl = entry["im:image"][2]["label"].string {
					let album = AlbumResponse(albumName: albumName, artistName: artistName, imageUrl: imageUrl)
					albums.append(album)
				}
			}
			
			self.success?(albums)
		}
	}
	
	func downloadImageFrom(urlString: String, completion: @escaping (Data) -> ()) {
		guard let url = URL(string: urlString) else {
			return
		}
		
		Alamofire.request(url).response { (dataResponse) in
			guard let data = dataResponse.data else {
				return
			}
			completion(data)
		}
	}
}
