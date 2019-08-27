//
//  Items+Item+Branch+Codable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/27/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Items.Item.Branch {
    // MARK: - Coding Keys
    public enum CodingKeys: String, CodingKey {
        case assignedBranchID = "AssignedBranchID"
        case assignedBranchName = "AssignedBranchName"
        case loaningBranchID = "LoaningBranchID"
        case loaningBranchName = "LoaningBranchName"
    }
}

extension Items.Item.Branch {
    // MARK: Initialization
    public init(from decoder: Decoder, forType type: BranchType) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        switch type {
        case .assigned:
            self._ID = try data.decode(Int.self, forKey: .assignedBranchID)
            self._name = try data.decode(String.self, forKey: .assignedBranchName)
            
        case .loaning:
            self._ID = try data.decode(Int.self, forKey: .loaningBranchID)
            self._name = try data.decode(String.self, forKey: .loaningBranchName)
        }
    }
}
