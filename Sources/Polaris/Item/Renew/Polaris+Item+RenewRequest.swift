//
//  Polaris+Item+RenewRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Item {

    public struct RenewRequest: Encodable {
        
        // MARK: - Public Properties
        public private(set) var action: String
        public private(set) var branchId: Int
        public private(set) var userId: Int
        public private(set) var workstationId: Int
        public private(set) var renewData: RenewData
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case action = "Action"
            case branchId = "LogonBranchID"
            case renewData = "RenewData"
            case userId = "LogonUserID"
            case workstationId = "LogonWorkstationID"
        }
        
        // MARK: - Initialization
        public init(action: String = "renew", logonData: LogonData, ignoreErrors: Bool = false) {
            
            self.action = action
            self.branchId = logonData.branchId
            self.userId = logonData.userId
            self.workstationId = logonData.workstationId
            self.renewData = RenewData(ignoreErrors: ignoreErrors)
        }
    }
}
