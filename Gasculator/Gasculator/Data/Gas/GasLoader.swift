//
//  GasStationLoader.swift
//  Networking
//
//  Created by Markiian on 10/3/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation


class GasStationLoader {
    static let shared = GasStationLoader()
    private let decoder = JSONDecoder()
    
    func load() {
        let urlString = "https://gasculator.herokuapp.com/\(DataManager.shared.selectedCar.fuelTypeString ?? "gas95")/\(DataManager.shared.latitude ?? 0.0)/\(DataManager.shared.longitude ?? 0.0)"
        let url = URL(string: urlString)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let d = data, d.count > 0 {
                let district = try? self.decoder.decode(District.self, from: d)
                
                GasStationStorage.shared.gasStations = district?.gasStations ?? []
                GasStationStorage.shared.sync()
            }
            
        }
        dataTask.priority = 0
        dataTask.resume()
    }
}
