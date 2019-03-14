//
//  AuthenticatedStaffUser.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct AuthenticatedStaffUser: Codable {
    let errorCode: Int
    let errorMessage: String?
    let accessToken: String
    let accessSecret: String
    let polarisUserId: Int
    let branchId: Int
    let authExpDate: String
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "PAPIErrorCode"
        case errorMessage = "ErrorMessage"
        case accessToken = "AccessToken"
        case accessSecret = "AccessSecret"
        case polarisUserId = "PolarisUserID"
        case branchId = "BranchID"
        case authExpDate = "AuthExpDate"
    }
}
