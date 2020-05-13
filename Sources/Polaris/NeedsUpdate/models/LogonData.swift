//
//  LogonData.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct LogonData {
    
    // MARK: - Public Properties
    public var branchId: Int
    public var userId: Int
    public var workstationId: Int
    
    // MARK: - Initialization
    public init(branch: Int, user: Int, workstation: Int) {
        self.branchId = branch
        self.userId = user
        self.workstationId = workstation
    }
}
