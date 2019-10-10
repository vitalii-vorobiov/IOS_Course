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
    
    var selectedCar: Car!
    var tripDuration: Int!
    var tripDistance: Int!
}
