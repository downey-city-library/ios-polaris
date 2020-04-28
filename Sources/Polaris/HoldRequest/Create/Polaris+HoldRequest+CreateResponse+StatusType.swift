//
//  Polaris+HoldRequest+CreateResponse+StatusType.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest.CreateResponse {
    
    public enum StatusType: Int, Decodable {
        
        case answer = 2
        case conditional = 3
        case error = 1
        case unknown = -1
    }
}

// MARK: - Initialization
extension Polaris.HoldRequest.CreateResponse.StatusType {

    public init(from decoder: Decoder) throws {
        self = try Polaris.HoldRequest.CreateResponse.StatusType(from: decoder, default: .unknown)
    }
}

// MARK: - Properties
extension Polaris.HoldRequest.CreateResponse.StatusType {
    
    public var description: String {
        switch self {
        case .answer: return "Answer"
        case .conditional: return "Conditional"
        case .error: return "Error"
        case .unknown: return "Unknown"
        }
    }
    
    public var int: Int { return self.rawValue }
}
