//
//  Patron++Name+Title.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Name {
    public enum Title: String, Codable {
        case dr = "Dr."
        case miss = "Miss"
        case mr = "Mr."
        case mrs = "Mrs."
        case ms = "Ms."
        case none = "None"
    }
}
