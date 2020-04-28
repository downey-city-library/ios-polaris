//
//  Polaris+HoldRequest+CancelResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/4/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {
    
    public struct CancelResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var cancelledHolds: [CancelledHold]?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case rows = "HoldRequestCancelRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            cancelledHolds = try? data.decode([CancelledHold].self, forKey: .rows)
        }
    }
}
