//
//  Car+CoreDataClass.swift
//
//
//  Created by Adriyan Bevz on 10/5/19.
//
//

import Foundation
import CoreData

enum FuelType: String {
    case Gas95 = "gas95"
    case Gas92 = "gas92"
    case Diesel = "diesel"
}

@objc(Car)
public class Car: NSManagedObject {
    var fuelType: FuelType {
        get {
            return FuelType(rawValue: fuelTypeString ?? "gas95") ?? .Gas95
        }
        set (newFuelType) {
            fuelTypeString = newFuelType.rawValue
        }
    }
}
