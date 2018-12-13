//
//  TopAlbumHeader.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/11/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

protocol TopAlbumHeaderDelegate: class {
	func userDidASearch(searchBar: UISearchBar, userSearch: String, segmentedControlIndex: Int)
}

class TopAlbumHeader: UITableViewHeaderFooterView {
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	@IBOutlet weak var searchBar: UISearchBar!
	
	weak var delegate: TopAlbumHeaderDelegate?
	
	func setup(currentSelection: Int) {
		searchBar.delegate = self
		segmentedControl.selectedSegmentIndex = currentSelection
	}
	
	@IBAction func numberOfResultsChanged(_ sender: Any) {
		performAction(text: "")
	}
}

extension TopAlbumHeader: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchText = searchBar.text else {
			return
		}
		
		delegate?.userDidASearch(searchBar: searchBar, userSearch: searchText, segmentedControlIndex: segmentedControl.selectedSegmentIndex)
//		performAction(text: searchText)
	}
	
	func performAction(text: String) {
		delegate?.userDidASearch(searchBar: searchBar, userSearch: text, segmentedControlIndex: segmentedControl.selectedSegmentIndex)
	}
}
