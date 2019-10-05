//
//  GasStation.swift
//  Networking
//
//  Created by Markiian on 10/3/19.
//  Copyright © 2019 ucu. All rights reserved.
//


import Foundation

struct GasStation {
    var name: String
    var price: Float
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
    }
}

struct District {
    var name: String
    var gasStations: [GasStation]
    
    enum CodingKeys: String, CodingKey {
        case name = "district"
        case gasStations = "prices"
    }
}


extension District: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.gasStations = try container.decode([GasStation].self, forKey: .gasStations)
    }
}

extension GasStation: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Float.self, forKey: .price)
    }
}
