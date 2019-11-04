//
//  AuthenticatedStaffUser.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct AuthenticatedStaffUser {
    // MARK: - Private Properties (Get/Set)
    internal var _access: Access?
    internal var _branchID: Int
    internal var _error: PolarisError?
    internal var _polarisUserID: Int
    
    // MARK: - Public Properties (Get Only)
    public var access: Access? { get { return _access } }
    public var branchID: Int { get { return _branchID } }
    public var error: PolarisError? { get { return _error } }
    public var polarisUserID: Int { get { return _polarisUserID } }
    
    // MARK: - Coding Keys
    internal enum CodingKeys: String, CodingKey {
        // access
        case accessToken = "AccessToken"
        case accessSecret = "AccessSecret"
        case authExpDate = "AuthExpDate"
        
        // error
        case errorCode = "PAPIErrorCode"
        case errorMessage = "ErrorMessage"
        
        // misc
        case polarisUserID = "PolarisUserID"
        case branchID = "BranchID"
    }
}
