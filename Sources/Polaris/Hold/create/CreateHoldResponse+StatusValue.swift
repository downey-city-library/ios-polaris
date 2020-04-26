//
//  CreateHoldResponse+StatusValue.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension CreateHoldResponse {
    
    public enum StatusValue: Int, Decodable {
        
        case success = 1
        case conditionalAvailableLocally = 3
        case conditionalAcceptILLPolicy = 4
        case conditionalExistingHolds = 5
        case conditionalNoItemsAttached = 6
        case conditionalAcceptLocalHoldPolicy = 7
        case errorSelectPickupLocation = 2
        case errorRequestsNotAllowed = 26
        case errorLogin = 0
        case unknown = -1
    }
}

// MARK: - Initialization
extension CreateHoldResponse.StatusValue {
    
    public init(from decoder: Decoder) throws {
        self = try CreateHoldResponse.StatusValue(from: decoder, default: .unknown)
    }
}

// MARK: - Properties
extension CreateHoldResponse.StatusValue {
    
    public var description: String {
        switch self {
        case .success: return "Hold request placed"
        case .conditionalAvailableLocally: return "Conditional: Item available locally"
        case .conditionalAcceptILLPolicy: return "Conditional: Accept ILL policy"
        case .conditionalExistingHolds: return "Conditional: Accept even with existing holds"
        case .conditionalNoItemsAttached: return "Conditional: No items attached, still place hold"
        case .conditionalAcceptLocalHoldPolicy: return "Conditional: Accept local hold policy"
        case .errorSelectPickupLocation: return "Error: Select pickup location"
        case .errorRequestsNotAllowed: return "Error: Requests are not permitted for this title"
        case .errorLogin: return "Error: Login"
        case .unknown: return "Error: Response not defined"
        }
    }
    
    public var int: Int { return self.rawValue }
}
