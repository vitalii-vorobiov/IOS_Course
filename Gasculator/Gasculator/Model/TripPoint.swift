//
//  TripPoint.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 UCU iOS. All rights reserved.
//

import Foundation
import CoreData

@objc(TripPoint)
public class TripPoint: NSManagedObject {
    @NSManaged public var Name: String
}

extension TripPoint {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TripPoint> {
        return NSFetchRequest<TripPoint>(entityName: "TripPoint")
    }
}

extension TripPoint {
    @objc(addTripPoint:)
    @NSManaged public func addTripPoint(_ value: TripPoint)
    
    @objc(addTripPoints:)
    @NSManaged public func addTripPoints(_ values: NSSet)
    
    @objc(removeTripPoint:)
    @NSManaged public func removeTripPoint(_ value: TripPoint)
    
    @objc(removeTripPoints:)
    @NSManaged public func removeTripPoints(_ values: NSSet)
}
