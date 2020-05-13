//
//  Polaris+Patron+Registration+UpdateRequest+EmailFormat.swift
//  Polaris
//
//  Created by Andrew Despres on 8/6/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Registration.UpdateRequest {
    
    public struct EmailFormat: Encodable {
        
        // MARK: - Properties
        public private(set) var description: String?
        public private(set) var id: Int?

        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case description = "DeliveryEmailFormatDescription"
            case id = "DeliveryEmailFormatID"
        }
    }
}
