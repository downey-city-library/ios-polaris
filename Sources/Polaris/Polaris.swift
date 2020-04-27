//
//  Polaris.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

public struct Polaris {

    // MARK: - Private Properties
    private static var _activePatron: Patron?
    
    // MARK: - Public Properties
    public static var activePatron: Patron? {
        get {
            if _activePatron == nil { _activePatron = Patron() }
            return _activePatron
        }
        set { _activePatron = newValue }
    }
    
    static public internal(set) var authenticatedPatron: Authenticate.AuthenticatedPatron?
    static public internal(set) var authenticatedStaffUser: Authenticate.AuthenticatedStaffUser?
}
