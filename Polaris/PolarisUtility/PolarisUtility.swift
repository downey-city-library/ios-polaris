//
//  PolarisUtility.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal struct PolarisUtility {
    static func getDate(from jsonDateString: String) -> Date {
        
        let start = jsonDateString.firstIndex(of: "(")!
        let end = jsonDateString.lastIndex(of: "-")!
        let trimmedString = jsonDateString[start...end].trimmingCharacters(in: ["(","-"])
        let dateInterval = TimeInterval(trimmedString)! / 1000.0
        
        return Date(timeIntervalSince1970: dateInterval)
    }
}
