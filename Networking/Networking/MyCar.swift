//
//  File.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/5/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation

enum FuelType: String {
    case Gas95 = "gas95"
    case Gas92 = "gas92"
    case Diesel = "diesel"
}

class Car {
    var name: String = ""
    var make: String = ""
    var model: String = ""
    var fuelType: FuelType = .Gas95
    var consumptionCity: Float = 1.0
    var consumptionHighway: Float = 1.0
    
    func verbose() {
        print(self.name)
        print(self.fuelType.rawValue)
        print(self.consumptionCity)
        print(self.consumptionHighway)
    }
}