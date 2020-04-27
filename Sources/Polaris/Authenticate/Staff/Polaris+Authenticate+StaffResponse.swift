//
//  Polaris+Authenticate+StaffResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Authenticate {

    public struct StaffResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        
        public private(set) var access: Access?
        public private(set) var branchID: Int
        public private(set) var polarisUserID: Int
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case branchID = "BranchID"
            case polarisUserID = "PolarisUserID"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            access = errorCode == 0 ? try Access(from: decoder) : nil
            branchID = try data.decode(Int.self, forKey: .branchID)
            polarisUserID = try data.decode(Int.self, forKey: .polarisUserID)
        }
    }
}
