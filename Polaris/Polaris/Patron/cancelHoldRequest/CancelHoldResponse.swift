//
//  CancelHoldResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/4/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct CancelHoldResponse: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    private var _cancelledHolds: [CancelledHold]?
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    public var cancelledHolds: [CancelledHold]? { get { return _cancelledHolds } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case rows = "HoldRequestCancelRows"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _cancelledHolds = try? data.decode([CancelledHold].self, forKey: .rows)
    }
}

public struct CancelledHold: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _errorMessage: String?
    private var _id: Int
    private var _returnCode: Int
    
    // MARK: - Public Properties (Get Only)
    public var errorMessage: String? { get { return _errorMessage } }
    public var id: Int { get { return _id } }
    public var returnCode: Int { get { return _returnCode } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorMessage = "ErrorMessage"
        case id = "SysHoldRequestID"
        case returnCode = "ReturnCode"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        _errorMessage = try? data.decode(String.self, forKey: .errorMessage)
        _id = try data.decode(Int.self, forKey: .id)
        _returnCode = try data.decode(Int.self, forKey: .returnCode)
    }
}
