//
//  GasStationViewController.swift
//  Networking
//
//  Created by Markiian on 10/3/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit

class GasStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(storageDidSync), name: NSNotification.Name(rawValue: "synced"), object: nil)
    }
    
    @objc func storageDidSync() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GasStationLoader.shared.load()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let numberOfRows = GasStationStorage.shared.gasStations.count
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GasStationTableViewCell", for: indexPath) as! GasStationTableViewCell
        let data = GasStationStorage.shared.gasStations[indexPath.row]
        cell.nameField.text = data.name
        cell.priceField.text = String(data.price) + "$"
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
