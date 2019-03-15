//
//  BibRow.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct BibRow: Codable {
    let alternate: Bool
    let elementID: Int
    let label: String
    let occurence: Int
    let value: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case alternate = "Alternate"
        case elementID = "ElementID"
        case label = "Label"
        case occurence = "Occurence"
        case value = "Value"
    }
}
