//
//  Polaris+System+CarriersResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 5/22/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris.System {
    
    public struct CarriersResponse: Decodable {
        
        // MARK: - Properties
        public private(set) var error: PolarisError?
        public private(set) var carriers: [Carrier]
        
        // MARK: - Coding Keys
        private enum CodingKeys: String, CodingKey {
            
            case errorCode = "PAPIErrorCode"
            case rows = "SAMobilePhoneCarriersGetRows"
        }
        
        // MARK: - Initialization
        public init(from decoder: Decoder) throws {
            
            let data = try decoder.container(keyedBy: CodingKeys.self)
            let errorCode = try data.decode(Int.self, forKey: .errorCode)
            
            error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
            carriers = (try? data.decode([Carrier].self, forKey: .rows)) ?? []
        }
    }
}
