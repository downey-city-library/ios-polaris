//
//  UpdatePatronResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 9/17/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct UpdatePatronResponse: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        self._error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
    }
}
