//
//  Route.swift
//  Gasculator
//
//  Created by Adriyan on 10/10/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import Foundation

struct Route {
    var distance: Int = 0
    var duration: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case rows = "rows"
        case elements = "elements"
        case distance = "distance"
        case duration = "duration"
        case value = "value"
    }
}

extension Route {
    init(from data: Data) throws {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        guard let routeObject = jsonObject as? [String:Any] else { return }
        guard let rowsObjects = routeObject["rows"] as? [[String:Any]] else { return }
        let rowObject = rowsObjects[0]
        guard let elemetsObjects = rowObject["elements"] as? [[String:Any]] else { return }
        let elementObject = elemetsObjects[0]
        guard let distanceObject = elementObject["distance"] as? [String:Any] else { return }
        guard let durationObject = elementObject["duration"] as? [String:Any] else { return }
        guard let distanceValue = distanceObject["value"] as? Int else { return }
        guard let durationValue = durationObject["value"] as? Int else { return }

        self.distance = distanceValue
        self.duration = durationValue
    }
}
