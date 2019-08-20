//
//  AuthenticatedStaffUser+Access+Decodable.swift
//  Polaris
//
//  Created by Andrew Despres on 8/19/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension AuthenticatedStaffUser.Access: Decodable {
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: AuthenticatedStaffUser.CodingKeys.self)
        let expirationDate = try data.decode(String.self, forKey: .authExpDate)
        
        _expirationDate = PolarisUtility.getDate(from: expirationDate)
        _secret = try data.decode(String.self, forKey: .accessSecret)
        _token = try data.decode(String.self, forKey: .accessToken)
    }
}
