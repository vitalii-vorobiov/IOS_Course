//
//  CarViewController.swift
//  Networking
//
//  Created by Markiian on 10/4/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit

class CarSettingsViewController: UIViewController, UITextFieldDelegate {
    
//    var currentCar: Car!
    
    @IBOutlet weak var citySpeedField: UITextField!
    @IBOutlet weak var highwaySpeedField: UITextField!
    @IBOutlet weak var curvedlineChart: LineChart!
    
    @IBOutlet weak var fuelChoice: UISegmentedControl!
    
    @IBAction func indexChanged(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            CarLoader.shared.selectedCar.fuelType = FuelType.Gas95
        case 1:
            CarLoader.shared.selectedCar.fuelType = FuelType.Gas92
        case 2:
            CarLoader.shared.selectedCar.fuelType = FuelType.Diesel
        default:
            break;
        }
        
        //        switch sender.selectedSegmentIndex {
//        case 0:
//            currentCar.fuelType = FuelType.Gas95
//        case 1:
//            currentCar.fuelType = FuelType.Gas92
//        case 2:
//            currentCar.fuelType = FuelType.Diesel
//        default:
//            break;
//        }
    }
    
    @IBAction func donePressed(sender: UIBarButtonItem) {
//        self.currentCar.verbose()
    }
    
    @objc func textFieldDidChangeCity(_ textField: UITextField) {
        CarLoader.shared.selectedCar.consumptionCity = Float(textField.text!) ?? 0.0
        self.updateChart()
    }
    
    @objc func textFieldDidChangeHighway(_ textField: UITextField) {
        CarLoader.shared.selectedCar.consumptionHighway = Float(textField.text!) ?? 0.0
        self.updateChart()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 {
            return true
          }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if Float(prospectiveText) != nil {
            return true
        }
        if  Int(prospectiveText) != nil {
            return true
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    
    func loadCar() {
        CarLoader.shared.selectedCar = Car()
        CarLoader.shared.selectedCar.name = "Model S"
        CarLoader.shared.selectedCar.fuelType = FuelType.Diesel
        CarLoader.shared.selectedCar.consumptionCity = 20.0
        CarLoader.shared.selectedCar.consumptionHighway = 10.0
        
    }
    
    func updateChart() {
        curvedlineChart.dataEntries = [
                PointEntry(value: Int(CarLoader.shared.selectedCar.consumptionCity), label: ""),
                PointEntry(value: Int(CarLoader.shared.selectedCar.consumptionCity), label: ""),
                PointEntry(value: Int(CarLoader.shared.selectedCar.consumptionHighway), label: ""),
                PointEntry(value: Int(CarLoader.shared.selectedCar.consumptionHighway) + 1, label: ""),
            ]
        self.citySpeedField.placeholder = String(CarLoader.shared.selectedCar.consumptionCity)
        self.highwaySpeedField.placeholder = String(CarLoader.shared.selectedCar.consumptionHighway)
        
        switch CarLoader.shared.selectedCar.fuelType {
        case .Gas92:
            self.fuelChoice.selectedSegmentIndex = 0
        case .Gas95:
            self.fuelChoice.selectedSegmentIndex = 1
        
        case .Diesel:
            self.fuelChoice.selectedSegmentIndex = 2

        }
        
        }
    
    override func viewDidLoad() {
       citySpeedField.delegate = self
       highwaySpeedField.delegate = self
       super.viewDidLoad()
       
       self.loadCar()
       self.updateChart()
       
       
       citySpeedField.addTarget(self, action: #selector(self.textFieldDidChangeCity(_:)), for: UIControl.Event.editingChanged)
       highwaySpeedField.addTarget(self, action: #selector(self.textFieldDidChangeHighway(_:)), for: UIControl.Event.editingChanged)
       
    
    }
}
