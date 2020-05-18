//
//  Polaris+RecordSet+GetResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/17/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.RecordSet {
    
    public struct GetResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var patrons: [Patron]
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case rows = "RecordSetRecordsGetRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            patrons = (try? data.decode([Patron].self, forKey: .rows)) ?? []
        }
    }
}
