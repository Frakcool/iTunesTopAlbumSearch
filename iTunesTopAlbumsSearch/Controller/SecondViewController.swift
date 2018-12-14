//
//  SecondViewController.swift
//  iTunesTopAlbumsSearch
//
//  Created by Frakcool on 12/11/18.
//  Copyright © 2018 Frakcool. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TopAlbumCell else {
			return UITableViewCell()
		}
		
		return cell
	}
}
