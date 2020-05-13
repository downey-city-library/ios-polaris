//
//  Polaris+Patron+PreferencesResponse+Preferences.swift
//  Polaris
//
//  Created by Andrew Despres on 10/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.PreferencesResponse {

    public struct Preferences: Decodable {
        
        // MARK: - Properties
        public private(set) var deliveryEmail: DeliveryEmail
        public private(set) var deliveryMethod: DeliveryMethod
        public private(set) var readingList: ReadingList
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            deliveryEmail = try DeliveryEmail(from: decoder)
            deliveryMethod = try DeliveryMethod(from: decoder)
            readingList = try ReadingList(from: decoder)
        }
    }
}
