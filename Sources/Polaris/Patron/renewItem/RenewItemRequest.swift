//
//  RenewItemRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct RenewItemRequest: Encodable {
    
    // MARK: - Public Properties
    public var action: String
    public var branchId: Int
    public var userId: Int
    public var workstationId: Int
    public var renewData: RenewData
    
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
