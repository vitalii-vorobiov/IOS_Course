//
//  CarLoader.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/5/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation


class CarLoader {
    static var shared = CarLoader()
    
    var selectedCar: Car!
    
//    var cars: Set<Car> = []
    var cars: [Car] = []
    
    func newCar(carName: String, carMake: String, carModel: String, fuelType: FuelType, consumptionCity: Float, consumptionHighway: Float) -> Car {
        let car = Car()
        
        car.name = carName
        car.make = carMake
        car.model = carModel
        car.fuelType = fuelType
        car.consumptionCity = consumptionCity
        car.consumptionHighway = consumptionHighway
        
        cars.insert(car, at: cars.count)
        
        return car
    }
    
    func deleteCar(carToDelete: Car) {
        if let index = cars.firstIndex(of: carToDelete) {
            cars.remove(at: index)
        }
    }
    
}
