//
//  FirstViewController.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/11/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	var iTunesService = ITunesService()
	var albums: [AlbumResponse] = []
	var currentHeaderIndex = 0
    var albumToSend: AlbumResponse?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib(nibName: "TopAlbumHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
		
		iTunesService.downloadTopAlbums(number: 5)
		self.setupITunesService()
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsController = segue.destination as! DetailsViewController
        detailsController.album = albumToSend
    }
}

extension FirstViewController: TopAlbumHeaderDelegate {
	func userDidASearch(searchBar: UISearchBar, userSearch: String, segmentedControlIndex: Int) {
		self.view.endEditing(true)
		
		var numberOfResults = 0
		
		switch segmentedControlIndex {
		case 0:
			numberOfResults = 5
		case 1:
			numberOfResults = 10
		case 2:
			numberOfResults = 25
		case 3:
			numberOfResults = 50
		default:
			numberOfResults = 75
		}
		
		currentHeaderIndex = segmentedControlIndex
		iTunesService.downloadTopAlbums(number: numberOfResults)
	}
	
	func setupITunesService() {
		let success: AlbumsSuccess = { [unowned self] albumsResponse in
            DispatchQueue.main.async {
                self.albums = albumsResponse
                self.tableView.reloadData()
            }
		}
		
		iTunesService.success = success
	}
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return albums.count
	}
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumToSend = albums[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TopAlbumCell else {
			return UITableViewCell()
		}
		
		cell.setup(album: albums[indexPath.row])
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TopAlbumHeader else {
			return UITableViewCell()
		}
		
		header.setup(currentSelection: currentHeaderIndex)
		header.delegate = self
		
		return header
	}
}
