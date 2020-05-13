//
//  Polaris+Patron+BasicDataResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {
    
    public struct BasicDataResponse: Decodable {
                
        // MARK: - Properties
        public private(set) var basicData: BasicData
        public private(set) var error: PolarisError?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case basicData = "PatronBasicData"
            case errorCode = "PAPIErrorCode"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            
            basicData = try data.decode(BasicData.self, forKey: .basicData)
        }
    }
}
