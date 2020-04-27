//
//  Polaris+Bib+GetHoldingsResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 12/10/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.Bib {
    
    public struct GetHoldingsResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var holdings: [Holding]?
        public private(set) var error: PolarisError?
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case rows = "BibHoldingsGetRows"
            case errorCode = "PAPIErrorCode"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            holdings = try? data.decode([Holding].self, forKey: .rows)
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        }
    }

}
