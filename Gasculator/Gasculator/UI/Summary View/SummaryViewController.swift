//
//  SummaryViewController.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/11/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var tripOriginLabel: UILabel!
    @IBOutlet weak var tripDestinationLabel: UILabel!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var avgConsumptionLabel: UILabel!
    @IBOutlet weak var fuelPriceLabel: UILabel!
    @IBOutlet weak var tripDistanceLabel: UILabel!
    @IBOutlet weak var tripDurationLabel: UILabel!
    @IBOutlet weak var avgSpeedLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let distanceKm = Float(DataManager.shared.tripDistance) / 1000.0
        let durationHours = Float(DataManager.shared.tripDuration) / 3600.0
        let avgSpeed: Float = distanceKm / durationHours
        var avgConsumption: Float = 0.0
        
        let consumptionCity = DataManager.shared.selectedCar.consumptionCity
        let consumptionHighway = DataManager.shared.selectedCar.consumptionHighway

        
        if (avgSpeed < 30.0) {
            avgConsumption = consumptionCity
        } else if (avgSpeed > 80.0) {
            avgConsumption = consumptionHighway
        } else {
            let interpolant = (avgSpeed - 30.0) / 50.0
            avgConsumption = consumptionHighway + (consumptionCity - consumptionHighway) * interpolant
        }
        
        tripOriginLabel.text = DataManager.shared.originName
        tripDestinationLabel.text = DataManager.shared.destinationName
        carNameLabel.text = DataManager.shared.selectedCar.name
        fuelPriceLabel.text = String(DataManager.shared.selectedFuelPrice)
        tripDistanceLabel.text = String(distanceKm) + " km"
        tripDurationLabel.text = String(durationHours) + " h"
        avgSpeedLabel.text = String(avgSpeed) + " km/h"
        totalPriceLabel.text = String(avgConsumption * DataManager.shared.selectedFuelPrice)
        
        super.viewWillAppear(animated)
    }

    

}
