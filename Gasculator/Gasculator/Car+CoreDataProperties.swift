//
//  Car+CoreDataProperties.swift
//  
//
//  Created by Adriyan Bevz on 10/5/19.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func carFetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var name: String?
    @NSManaged public var make: String?
    @NSManaged public var model: String?
    @NSManaged public var fuelTypeString: String?
    @NSManaged public var consumptionCity: Float
    @NSManaged public var consumptionHighway: Float
}
