//
//  AuthenticatedStaffUser+Decodable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/19/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension AuthenticatedStaffUser: Decodable {
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _access = errorCode == 0 ? try Access(from: decoder) : nil
        _branchID = try data.decode(Int.self, forKey: .branchID)
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _polarisUserID = try data.decode(Int.self, forKey: .polarisUserID)
    }
}
