//
//  CarLoader.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/5/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation


class DataManager {
    static var shared = DataManager()
    
    var latitude: Double!
    var longitude: Double!
    var tripDuration: Int!
    var tripDistance: Int!
    var originName: String!
    var destinationName: String!
    
    var selectedCar: Car!
    
    var selectedFuelPrice: Float!
}
