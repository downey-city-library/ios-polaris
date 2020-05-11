//
//  CancelHoldRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 11/4/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {

    public struct CancelRequest: Encodable {
        
        // MARK: - Public Properties
        public private(set) var workstationID: Int
        public private(set) var userID: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case workstationID = "wsid"
            case userID = "userid"
        }
        
        // MARK: - Initialization
        public init(userID: Int, workstationID: Int) {
            
            self.workstationID = workstationID
            self.userID = userID
        }
    }
}
