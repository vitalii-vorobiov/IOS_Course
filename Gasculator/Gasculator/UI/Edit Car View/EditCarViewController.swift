//
//  CarViewController.swift
//  Networking
//
//  Created by Markiian on 10/4/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit

class EditCarViewController: UIViewController, UITextFieldDelegate, UIActionSheetDelegate {
    
    weak var currentCar: Car!
    
    // MARK: Outlets
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var cityConsumptionField: UITextField!
    @IBOutlet weak var highwayConsumptionField: UITextField!
    @IBOutlet weak var consumptionChart: LineChart!
    
    @IBOutlet weak var fuelChoice: UISegmentedControl!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        cityConsumptionField.delegate = self
        highwayConsumptionField.delegate = self
        
        self.currentCar = DataManager.shared.selectedCar
        
        nameField.text = currentCar.name
        makeField.text = currentCar.make
        modelField.text = currentCar.model
        
        cityConsumptionField.text = String(currentCar.consumptionCity)
        highwayConsumptionField.text = String(currentCar.consumptionHighway)
        
        switch self.currentCar.fuelType {
        case .Gas92:
            self.fuelChoice.selectedSegmentIndex = 0
        case .Gas95:
            self.fuelChoice.selectedSegmentIndex = 1
        case .Diesel:
            self.fuelChoice.selectedSegmentIndex = 2
        }
        
        self.updateChart()
       
        cityConsumptionField.addTarget(self, action: #selector(self.fieldDidChangeCity(_:)), for: UIControl.Event.editingChanged)
        highwayConsumptionField.addTarget(self, action: #selector(self.fieldDidChangeHighway(_:)), for: UIControl.Event.editingChanged)
        
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func savePressed() {
        self.currentCar.name = nameField.text
        self.currentCar.make = makeField.text
        self.currentCar.model = modelField.text
        self.currentCar.consumptionCity = NumberFormatter().number(from: cityConsumptionField.text ?? "")?.floatValue ?? self.currentCar.consumptionCity
        self.currentCar.consumptionHighway = NumberFormatter().number(from: highwayConsumptionField.text ?? "")?.floatValue ?? self.currentCar.consumptionHighway
        switch fuelChoice.selectedSegmentIndex {
        case 0:
            self.currentCar.fuelType = .Gas92
        case 1:
            self.currentCar.fuelType = .Gas95
        case 2:
            self.currentCar.fuelType = .Diesel
        default:
            self.currentCar.fuelType = .Gas95
        }
        CoreDataStack.shared.saveContext()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func indexChanged(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            currentCar.fuelType = FuelType.Gas95
        case 1:
            currentCar.fuelType = FuelType.Gas92
        case 2:
            currentCar.fuelType = FuelType.Diesel
        default:
            break;
        }
    }
    
    @IBAction func deletePressed(sender: AnyObject)
    {

         let alert = UIAlertController(title: "Delete car", message: "Delete car", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            self.performSegue(withIdentifier: "endScreenSegue", sender: self)
        }))

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        
    }
    
    
    @objc func fieldDidChangeCity(_ textField: UITextField) {
        self.currentCar.consumptionCity = Float(textField.text!) ?? 0.0
        self.updateChart()
    }
    
    @objc func fieldDidChangeHighway(_ textField: UITextField) {
        self.currentCar.consumptionHighway = Float(textField.text!) ?? 0.0
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
    
    func updateChart() {
        consumptionChart.dataEntries = [
            PointEntry(value: Int(self.currentCar.consumptionCity * 1.2), label: ""),
                PointEntry(value: Int(self.currentCar.consumptionCity), label: ""),
                PointEntry(value: Int(self.currentCar.consumptionHighway), label: ""),
                PointEntry(value: Int(self.currentCar.consumptionHighway * 1.2), label: "")
            ]
        }
}
