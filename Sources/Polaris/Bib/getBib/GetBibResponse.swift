//
//  GetBibResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/25/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct GetBibResponse: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _bib: Bib
    private var _error: PolarisError?
    
    // MARK: - Public Properties (Get Only)
    public var bib: Bib { get { return _bib } }
    public var error: PolarisError? { get { return _error } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case rows = "BibGetRows"
        case errorCode = "PAPIErrorCode"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _bib = Bib()
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        
        if let rows = try? data.decode([BibRow].self, forKey: .rows) {
            for row in rows {
                _bib.setElementBy(id: row.elementID, value: row.value)
            }
        }
    }
}
