//
//  Trip.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 UCU iOS. All rights reserved.
//

import Foundation
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
    @NSManaged public var Name: String
}

extension Trip {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }
}

extension Trip {
    @objc(addTrip:)
    @NSManaged public func addTrip(_ value: Trip)
    
    @objc(addTrips:)
    @NSManaged public func addTrips(_ values: NSSet)
    
    @objc(removeTrip:)
    @NSManaged public func removeTrip(_ value: Trip)
    
    @objc(removeTrips:)
    @NSManaged public func removeTrips(_ values: NSSet)
}

