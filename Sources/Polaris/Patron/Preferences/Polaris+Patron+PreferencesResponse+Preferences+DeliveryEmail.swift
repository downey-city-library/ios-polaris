//
//  Polaris+Patron+PreferencesResponse+Preferences+DeliveryEmail.swift
//  Polaris
//
//  Created by Andrew Despres on 10/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.PreferencesResponse.Preferences {

    public struct DeliveryEmail {

        // MARK: - Properties
        public private(set) var format: Format

        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            format = try Format(from: decoder)
        }
    }
}
