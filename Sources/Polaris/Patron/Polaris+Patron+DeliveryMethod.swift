//
//  Polaris+Patron+DeliveryMethod.swift
//  Polaris
//
//  Created by Andrew Despres on 5/17/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {
    
    public enum DeliveryMethod: Int, Codable {
        
        case none = 0
        case mail = 1
        case email = 2
        case phone1 = 3
        case phone2 = 4
        case phone3 = 5
        case fax = 6
        case EDI = 7
        case TXT = 8
        
        public var ID: Int { return self.rawValue }
        
        public var description: String {
            switch self {
            case .none: return "None"
            case .mail: return "Mailing Address"
            case .email: return "E-Mail"
            case .phone1: return "Phone 1"
            case .phone2: return "Phone 2"
            case .phone3: return "Phone 3"
            case .fax: return "Fax"
            case .EDI: return "EDI"
            case .TXT: return "TXT Messaging"
            }
        }
    }
}
