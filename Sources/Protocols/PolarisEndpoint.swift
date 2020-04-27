//
//  PolarisEndpoint.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

protocol PolarisEndpoint {
    
    var string: String { get }
    var url: URL { get }
}

extension PolarisEndpoint {
    
    var url: URL { return URL(string: self.string)! }
}
