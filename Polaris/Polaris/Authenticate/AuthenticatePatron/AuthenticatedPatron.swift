//
//  AuthenticatedPatron.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct AuthenticatedPatron: Codable {
    public let errorCode: Int
    public let errorMessage: String?
    public let accessToken: String
    public let patronId: Int
    
    fileprivate enum CodingKeys: String, CodingKey {
        case errorCode = "PAPIErrorCode"
        case errorMessage = "ErrorMessage"
        case accessToken = "AccessToken"
        case patronId = "PatronID"
    }
}
