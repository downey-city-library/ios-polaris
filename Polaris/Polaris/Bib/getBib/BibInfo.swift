//
//  BibInfo.swift
//  Polaris
//
//  Created by Andrew Despres on 3/14/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public struct BibInfo: Codable {
    let bibRows: [BibRow]
    let errorCode: Int
    let errorMessage: String
    
    fileprivate enum CodingKeys: String, CodingKey {
        case bibRows = "BibGetRows"
        case errorCode = "PAPIErrorCode"
        case errorMessage = "ErrorMessage"
    }
}
