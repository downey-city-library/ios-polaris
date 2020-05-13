//
//  Polaris+Patron+PreferencesResponse+Preferences+ReadingList.swift
//  Polaris
//
//  Created by Andrew Despres on 10/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.PreferencesResponse.Preferences {

    public struct ReadingList {

        // MARK: - Properties
        public private(set) var isEnabled: Bool?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {

            case isEnabled = "ReadingListEnabled"
        }

        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)

            isEnabled = try? data.decode(Bool.self, forKey: .isEnabled)
        }
    }
}
