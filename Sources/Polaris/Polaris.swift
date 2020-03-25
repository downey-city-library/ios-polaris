//
//  Polaris.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public class Polaris {

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
    
    public static var authenticatedPatron: AuthenticatedPatron?
    public static var authenticatedStaffUser: AuthenticatedStaffUser?
}
