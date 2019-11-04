//
//  GetItemsOutResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/2/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct GetItemsOutResponse: Decodable {
    
    // MARK: - Typealiases
    public typealias Item = Patron.Item
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    private var _items: [Item]?
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    public var items: [Item]? { get { return _items } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case rows = "PatronItemsOutGetRows"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _items = try? data.decode([Item].self, forKey: .rows)
    }
}
