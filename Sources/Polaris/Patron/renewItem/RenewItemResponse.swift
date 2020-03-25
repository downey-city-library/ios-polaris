//
//  RenewItemResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/5/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct RenewItemResponse: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    private var _results: RenewalResults
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    public var results: RenewalResults { get { return _results } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case renewalResults = "ItemRenewResult"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _results = try data.decode(RenewalResults.self, forKey: .renewalResults)
    }
}
