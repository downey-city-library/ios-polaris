//
//  Polaris+Patron+HoldsResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {

    public struct HoldsResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var holdRequests: [HoldRequest]?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case rows = "PatronHoldRequestsGetRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            holdRequests = try? data.decode([HoldRequest].self, forKey: .rows)
        }
    }
}
