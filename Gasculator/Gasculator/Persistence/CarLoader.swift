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
    
    var cars: Set<Car> = []
    
    func newCar(carName: String, carMake: String, carModel: String, fuelType: FuelType, consumptionCity: Float, consumptionHighway: Float) -> Car {
        let car = Car()
        
        car.name = carName
        car.make = carMake
        car.model = carModel
        car.fuelType = fuelType
        car.consumptionCity = consumptionCity
        car.consumptionHighway = consumptionHighway
        
        cars.insert(car)
        
        return car
    }
    
    func deleteCar(carToDelete: Car) {
        cars.remove(carToDelete)
    }
    
}
