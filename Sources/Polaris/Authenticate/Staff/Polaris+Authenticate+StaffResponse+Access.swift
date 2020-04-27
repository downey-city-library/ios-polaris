//
//  Polaris+Authenticate+StaffResponse+Access.swift
//  Polaris
//
//  Created by Andrew Despres on 8/19/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Authenticate.StaffResponse {
    
    public struct Access {
        
        // MARK: - Properties
        public private(set) var expirationDate: Date
        public private(set) var secret: String
        public private(set) var token: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case accessToken = "AccessToken"
            case accessSecret = "AccessSecret"
            case authExpDate = "AuthExpDate"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            
            expirationDate = (try data.decode(String.self, forKey: .authExpDate)).toDate()!
            secret = try data.decode(String.self, forKey: .accessSecret)
            token = try data.decode(String.self, forKey: .accessToken)
        }
    }
}
