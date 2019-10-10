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
    
//    @IBOutlet weak var carSettingsViewController: CarSettingsViewController!
    
    @IBAction public func addNewCarClicked(_ sender: UIButton) {
        let car = CoreDataStack.shared.newCar();
        DataManager.shared.selectedCar = car
        self.performSegue(withIdentifier: "GoToCarSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        super.viewWillAppear(animated)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataStack.shared.getCars().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarSelectTableViewCell", for: indexPath) as! CarSelectTableViewCell
        cell.delegate = self
        let car = CoreDataStack.shared.getCars()[indexPath.row]
        cell.carNameLabel.text = car.name == "" ? "No name" : car.name
        let makeModel = (car.make ?? "Make") + " " + (car.model ?? "Model")
        cell.carMakeAndModelLabel.text = makeModel
            
        cell.car = car
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataManager.shared.selectedCar = CoreDataStack.shared.getCars()[indexPath.row]
        self.performSegue(withIdentifier: "GoToCarSettings", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(segue.identifier)
        //        switch segue.identifier {
//        case "a":
//
//        default:
//            <#code#>
//        }
    }

}


extension CarSelectTableViewController: SettingsButtonDelegate {
    func settingsButtonClicked(with car: Car?) {
        DataManager.shared.selectedCar = car
        self.performSegue(withIdentifier: "GoToCarSettings", sender: self)
    }
}
