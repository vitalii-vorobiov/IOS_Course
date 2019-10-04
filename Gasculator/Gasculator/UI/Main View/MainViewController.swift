//
//  MainViewController.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationSelectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.locationSelectView.isHidden = true
    }
    
    @IBAction public func showLocationSelectView(_ sender: Any) {
        
        // On application start, the view is hidden
        if (self.locationSelectView.isHidden) {
            self.locationSelectView.center.y += self.locationSelectView.frame.height
            
            self.locationSelectView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.3) {
         self.locationSelectView.center.y -= self.locationSelectView.frame.height
        }
    }
    
    @IBAction public func hideLocationSelectView(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
         self.locationSelectView.center.y += self.locationSelectView.frame.height
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 99
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripDestinationsTableViewCell", for: indexPath)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
}
