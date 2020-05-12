//
//  Polaris+HoldRequest+SuspendRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {

    public struct SuspendRequest: Encodable {
        
        // MARK: - Public Properties
        public private(set) var userID: Int
        public private(set) var activationDate: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case activationDate = "ActivationDate"
            case userID = "UserID"
        }
        
        // MARK: - Initialization
        public init(userID: Int, activationDate: String) {
            
            self.userID = userID
            self.activationDate = activationDate
        }
    }
}
