//
//  CarSelectTableViewController.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation
import UIKit



class CarSelectTableViewController: UITableViewController {
    
    @IBOutlet weak var carSettingsViewController: CarSettingsViewController!
    
    @IBAction public func openCarSettings(_ sender: UIButton) {
        if let parentCarCell = sender.superview as? CarSelectTableViewCell {
            CarLoader.shared.selectedCar = parentCarCell.car
            self.performSegue(withIdentifier: "GoToCarSettings", sender: self)
        }
    }
    
    @IBAction public func addNewCar(_ sender: UIButton) {
        let car = CarLoader.shared.newCar(carName: "New Car", carMake: "Make", carModel: "Model", fuelType: .Gas95, consumptionCity: 15.0, consumptionHighway: 8.0)
        CarLoader.shared.selectedCar = car
        self.performSegue(withIdentifier: "GoToCarSettings", sender: self)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(CarLoader.shared.cars)
        return CarLoader.shared.cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarSelectTableViewCell", for: indexPath) as! CarSelectTableViewCell
        print(indexPath.row)
        let car = CarLoader.shared.cars[indexPath.row]
        cell.carNameLabel.text = car.name
        cell.carMakeAndModelLabel.text = car.make + " " + car.model
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        carSettingsViewController.currentCar = CarLoader.shared.cars[indexPath.count]
    }

}

