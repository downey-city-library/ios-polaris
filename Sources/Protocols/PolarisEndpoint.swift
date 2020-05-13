//
//  PolarisEndpoint.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

protocol PolarisEndpoint {
    
    var accessToken: String { get }
    var string: String { get }
    var url: URL { get }
}

extension PolarisEndpoint {
    
    var accessToken: String { return Polaris.authenticatedStaffUser?.access?.token ?? "" }
    var url: URL { return URL(string: self.string)! }
}
