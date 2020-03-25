//
//  GetHoldRequestsResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct GetHoldRequestsResponse: Decodable {
    
    // MARK: - Typealiases
    public typealias HoldRequest = Patron.HoldRequest
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    private var _requests: [HoldRequest]?
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    public var requests: [HoldRequest]? { get { return _requests } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case rows = "PatronHoldRequestsGetRows"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _requests = try? data.decode([HoldRequest].self, forKey: .rows)
    }
}
