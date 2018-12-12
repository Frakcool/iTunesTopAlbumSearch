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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib(nibName: "TopAlbumHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
	}
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TopAlbumCell else {
			return UITableViewCell()
		}
		
		cell.setup()
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TopAlbumHeader else {
			return UITableViewCell()
		}
		
		return header
	}
}
