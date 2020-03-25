//
//  CancelHoldRequest.swift
//  Polaris
//
//  Created by Andrew Despres on 11/4/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct CancelHoldRequest: Encodable {
    
    // MARK: - Public Properties
    public var workstationId: Int
    public var userId: Int
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case userId = "userid"
        case workstationId = "wsid"
    }
    
    // MARK: - Initialization
    public init(userId: Int, workstationId: Int) {
        self.workstationId = workstationId
        self.userId = userId
    }
}
