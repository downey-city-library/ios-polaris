//
//  Polaris+Bib+KeywordSearchResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 4/15/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib {
    
    public struct KeywordSearchResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var bibs: [Bib]
        public private(set) var count: Int
        public private(set) var query: String
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case bibs = "BibSearchRows"
            case count = "TotalRecordsFound"
            case query = "WordList"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            bibs = (try? data.decode([Bib].self, forKey: .bibs)) ?? []
            count = try data.decode(Int.self, forKey: .count)
            query = try data.decode(String.self, forKey: .query)
        }
    }
}
