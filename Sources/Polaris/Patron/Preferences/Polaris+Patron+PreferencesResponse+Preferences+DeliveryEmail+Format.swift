//
//  Polaris+Patron+PreferencesResponse+Preferences+DeliveryEmail+Format.swift
//  Polaris
//
//  Created by Andrew Despres on 10/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.PreferencesResponse.Preferences.DeliveryEmail {

    public struct Format {

        // MARK: - Properties
        public private(set) var description: String?
        public private(set) var id: Int?

        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case description = "DeliveryEmailFormatDescription"
            case id = "DeliveryEmailFormatID"
        }

        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)

            description = try? data.decode(String.self, forKey: .description)
            id = try? data.decode(Int.self, forKey: .id)
        }
    }
}
