//
//  Patron+Phones+Phone+Carrier.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron.Phones.Phone {
    public enum Carrier: Int, Codable {
        case none = 0
        case att = 1
        case sprint = 8
        case tmobile = 9
        case verizon = 11
        
        public var id: Int { return self.rawValue }
        
        public var string: String {
            switch self {
            case .att: return "AT&T"
            case .sprint: return "Sprint"
            case .tmobile: return "T-Mobile"
            case .verizon: return "Verizon"
            default: return "None"
            }
        }
    }
}
