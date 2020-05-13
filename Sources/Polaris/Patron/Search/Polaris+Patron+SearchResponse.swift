//
//  Polaris+Patron+SearchResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/11/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Patron {

    public struct SearchResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var query: String
        public private(set) var results: [Result]
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case query = "WordList"
            case results = "PatronSearchRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            query = try data.decode(String.self, forKey: .query)
            results = try data.decode([Result].self, forKey: .results)
        }
    }
}
