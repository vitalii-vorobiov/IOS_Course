//
//  CoreDataStack.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/3/19.
//  Copyright © 2019 UCU iOS. All rights reserved.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PersistenseTutorial")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func newCar() -> Car {
        let car = NSEntityDescription.insertNewObject(forEntityName: "Car", into: persistentContainer.viewContext) as! Car
        return car
    }
    
    func newTripPoint() -> TripPoint {
        let tripPoint = NSEntityDescription.insertNewObject(forEntityName: "TripPoint", into: persistentContainer.viewContext) as! TripPoint
        return tripPoint
    }
    
    func newTrip() -> Trip {
        let trip = NSEntityDescription.insertNewObject(forEntityName: "Trip", into: persistentContainer.viewContext) as! Trip
        return trip
    }
    
    func remove(car: Car) {
        persistentContainer.viewContext.delete(car)
    }

    func remove(tripPoint: TripPoint) {
        persistentContainer.viewContext.delete(tripPoint)
    }
    
    func remove(trip: Trip) {
        persistentContainer.viewContext.delete(trip)
    }
    
}
