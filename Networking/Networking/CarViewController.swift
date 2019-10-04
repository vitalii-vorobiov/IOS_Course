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

    
    @IBOutlet weak var citySpeedField: UITextField!
    @IBOutlet weak var highwaySpeedField: UITextField!
    @IBOutlet weak var curvedlineChart: LineChart!
    var dataEntries = [PointEntry]()
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(Float(textField.text!))
        self.dataEntries[1] = PointEntry(value: Int(textField.text!)!, label: "")
        curvedlineChart.dataEntries = self.dataEntries
    }
    
     override func viewDidLoad() {
            super.viewDidLoad()
    citySpeedField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
            // Sample dataset
        
        self.dataEntries = [
                PointEntry(value: 65, label: ""),
                PointEntry(value: 70, label: ""),
                PointEntry(value: 100, label: ""),
                PointEntry(value: 105, label: ""),
        ]
            
//            let dataEntries = generateRandomEntries()
            
        curvedlineChart.dataEntries = self.dataEntries
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
