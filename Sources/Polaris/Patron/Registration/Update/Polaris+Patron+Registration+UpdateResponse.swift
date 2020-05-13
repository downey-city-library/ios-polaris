//
//  Polaris+Patron+Registration+UpdateResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 9/17/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron.Registration {

    public struct UpdateResponse: Decodable {
        
        // MARK: - Properties
        public var error: PolarisError?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        }
    }
}
