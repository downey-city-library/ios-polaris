//
//  GetPreferencesResponse.swift
//  Polaris
//
//  Created by Andrew Despres on 11/3/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct GetPreferencesResponse: Decodable {
    
    // MARK: - Typealiases
    public typealias Preferences = Patron.Preferences
    
    // MARK: - Private Properties (Get/Set)
    private var _error: PolarisError?
    private var _preferences: Preferences?
    
    // MARK: - Public Properties (Get Only)
    public var error: PolarisError? { get { return _error } }
    public var preferences: Preferences? { get { return _preferences } }
    
    // MARK: - Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case errorCode = "PAPIErrorCode"
        case preferences = "PatronPreferences"
    }
    
    // MARK: - Initialization
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        let errorCode = try data.decode(Int.self, forKey: .errorCode)
        
        _error = errorCode == 0 ? nil : PolarisError(rawValue: errorCode)
        _preferences = try data.decode(Preferences.self, forKey: .preferences)
    }
}
