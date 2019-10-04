//
//  CarViewController.swift
//  Networking
//
//  Created by Markiian on 10/4/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit

class CarViewController: UIViewController {

    @IBOutlet weak var curvedlineChart: LineChart!
    
     override func viewDidLoad() {
            super.viewDidLoad()
            
            // Sample dataset
            var dataEntries = [
                PointEntry(value: 65, label: ""),
                PointEntry(value: 70, label: ""),
                PointEntry(value: 100, label: ""),
                PointEntry(value: 105, label: ""),
        ]
            
//            let dataEntries = generateRandomEntries()
            
            curvedlineChart.dataEntries = dataEntries
            curvedlineChart.isCurved = true
//
//       dataEntries = [PointEntry(value: 105, label: ""),
//        PointEntry(value: 29, label: ""),
//        PointEntry(value: 100, label: ""),
//        PointEntry(value: 105, label: ""),]
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
//            self.curvedlineChart.dataEntries = dataEntries
//        })
//
        }
}
