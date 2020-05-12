//
//  Polaris+HoldRequest+SuspendResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.HoldRequest {

    public struct SuspendResponse: Decodable {
        
        // MARK: - Public Properties
        public private(set) var error: PolarisError?
        public private(set) var suspendedHolds: [SuspendedHold]?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            case errorCode = "PAPIErrorCode"
            case rows = "HoldRequestActivationRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            print("initializing SuspendResponse")
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            print("error", error as Any)
            
            suspendedHolds = try? data.decode([SuspendedHold].self, forKey: .rows)
            print("suspendedHolds", suspendedHolds as Any)
        }
    }
}
