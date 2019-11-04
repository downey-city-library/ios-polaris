//
//  CreateRegistrationResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 3/29/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct CreateRegistrationResponse: Decodable {
    
    // MARK: - Private Properties (Get/Set)
    private var _barcode: String?
    private var _patronId: Int?
    
    // MARK: - Public Properties (Get Only)
    public var barcode: String? { get { return _barcode } }
    public var patronId: Int? { get { return _patronId } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case barcode = "Barcode"
        case patronId = "PatronID"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        _barcode = try? data.decode(String.self, forKey: .barcode)
        _patronId = try? data.decode(Int.self, forKey: .patronId)
    }
}
