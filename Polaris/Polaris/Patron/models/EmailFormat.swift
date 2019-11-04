//
//  EmailFormat.swift
//  Polaris
//
//  Created by Andrew Despres on 11/3/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Patron {
    
    public enum EmailFormat: Int {
        
        case plainText = 1
        case html = 2
        
        var value: Int { return self.rawValue }
    }
}
