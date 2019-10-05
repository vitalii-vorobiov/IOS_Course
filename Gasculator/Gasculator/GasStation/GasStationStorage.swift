//
//  GasStationStorage.swift
//  Networking
//
//  Created by Markiian on 10/3/19.
//  Copyright © 2019 ucu. All rights reserved.
//


import Foundation

class GasStationStorage {
    static let shared = GasStationStorage()
    
    var gasStations = [GasStation]()
    
    func sync() {
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "synced")))
    }
}
