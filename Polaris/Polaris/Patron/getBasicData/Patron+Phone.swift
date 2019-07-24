//
//  Patron+Phone.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    public struct Phone {
        public let number: String
        public let carrier: PhoneCarrier
        public let useForTXT: Bool
    }
}
