//
//  GetBasicDataResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/1/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct GetBasicDataResponse: Decodable {
    
    // MARK: - Typealiases
    public typealias BasicData = Patron.BasicData
    
    // MARK: - Private Properties (Get/Set)
    private var _basicData: BasicData
    private var _error: PolarisError?
    
    // MARK: - Public Properties (Get Only)
    public var basicData: BasicData { get { return _basicData } }
    public var error: PolarisError? { get { return _error } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case basicData = "PatronBasicData"
        case errorCode = "PAPIErrorCode"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _basicData = try data.decode(BasicData.self, forKey: .basicData)
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
    }
}
