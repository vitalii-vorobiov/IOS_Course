//
//  Car.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 UCU iOS. All rights reserved.
//

import Foundation
import CoreData

enum FuelType: String {
    case Gas = "Gas"
    case Diesel = "Diesel"
}

@objc(Car)
public class Car: NSManagedObject {
    @NSManaged public var Name: String
    @NSManaged public var Make: String
    @NSManaged public var Model: String
    
    @NSManaged public var ConsumptionCity: Float
    @NSManaged public var ConsumptionHighway: Float
}

extension Car {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }
}

extension Car {
    @objc(addCar:)
    @NSManaged public func addCar(_ value: Car)
    
    @objc(addCars:)
    @NSManaged public func addCars(_ values: NSSet)
    
    @objc(removeCar:)
    @NSManaged public func removeCar(_ value: Car)
    
    @objc(removeCars:)
    @NSManaged public func removeCars(_ values: NSSet)
}


