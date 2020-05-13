//
//  Polaris+Patron+NameTitle.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {
    
    public enum NameTitle: String, Codable {

        case dr = "Dr."
        case miss = "Miss"
        case mr = "Mr."
        case mrs = "Mrs."
        case ms = "Ms."
        case none = "None"
    }
}
