//
//  HTTPClient+Endpoint+Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum Bib: PolarisEndpoint {
        
        case booleanSearch(String, String)
        case get(Int)
        case getHoldings(Int)
        case keywordSearch(KeywordQualifier, String)
        
        var string: String {
            switch self {
            case .booleanSearch(let query, let sortby):
                return basePublic + "/search/bib/Boolean?q=\(query)&sortby=\(sortby)"
            case .get(let bibID):
                return basePublic + "/bib/\(bibID)"
            case .getHoldings(let bibID):
                return basePublic + "/bib/\(bibID)/holdings"
            case .keywordSearch(let qualifier, let query):
                return basePublic + "/search/bibs/keyword/\(qualifier.string)?q=\(query)"
            }
        }
    }
}
