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
        public var deliveryMethod: Polaris.Patron.DeliveryMethod
        public private(set) var readingList: ReadingList

        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case ID = "DeliveryMethodID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            deliveryEmail = try DeliveryEmail(from: decoder)
//            deliveryMethod = try DeliveryMethod(from: decoder)
            deliveryMethod = try data.decode(Polaris.Patron.DeliveryMethod.self, forKey: .ID)
            readingList = try ReadingList(from: decoder)
        }
    }
}
