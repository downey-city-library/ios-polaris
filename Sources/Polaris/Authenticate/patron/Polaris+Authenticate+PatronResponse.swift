//
//  AuthenticatePatronResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Authenticate {
 
    public struct PatronResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var accessToken: String
        public private(set) var patronID: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case accessToken = "AccessToken"
            case patronID = "PatronID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            accessToken = try data.decode(String.self, forKey: .accessToken)
            patronID = try data.decode(Int.self, forKey: .patronID)
        }
    }
}
