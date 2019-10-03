//
//  ViewController.swift
//  Gasculator
//
//  Created by Vitaliy Vorobyov on 10/2/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSearchOrigin(_ sender: Any) {
        performSegue(withIdentifier: "InitialSegue", sender: self)
    }
    
    @IBAction func onSearchDestination(_ sender: Any) {
        performSegue(withIdentifier: "InitialSegue", sender: self)
    }
}

