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
        let container = NSPersistentContainer(name: "GasculatorModel")
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
    
    func getCars() -> [Car] {
        let request = Car.carFetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let cars = try persistentContainer.viewContext.fetch(request)
            return cars// as! [Car]
        }
        catch {
            fatalError()
        }
    }
    
    func newCar() -> Car {
        let car = NSEntityDescription.insertNewObject(forEntityName: "Car", into: persistentContainer.viewContext) as! Car
        car.name = ""
        car.make = ""
        car.model = ""
        car.consumptionCity = 15.0
        car.consumptionHighway = 8.0
        car.fuelType = .Gas95
        return car
    }
    
    func remove(car: Car) {
        persistentContainer.viewContext.delete(car)
    }
}
