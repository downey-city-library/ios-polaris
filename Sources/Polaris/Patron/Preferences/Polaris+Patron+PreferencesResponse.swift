//
//  Polaris+Patron+PreferencesResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/3/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {
    
    public struct PreferencesResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var preferences: Preferences?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case preferences = "PatronPreferences"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            preferences = try data.decode(Preferences.self, forKey: .preferences)
        }
    }
}
