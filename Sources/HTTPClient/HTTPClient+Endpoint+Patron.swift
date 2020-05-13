//
//  HTTPClient+Endpoint+Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 5/12/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum Patron: PolarisEndpoint {
        
        case barcodeFromID(Int)
        case basicData(String)
        case holdRequests(String, String)
        case ILLRequests(String)
        case items(String, String)
        case preferences(String)
        case savedSearches(String)
        case search(String, Int, Int)
        case updateUsername(String, String)
        case validate(String)
        
        var string: String {
            switch self {
            case .barcodeFromID(let patronID):
                return baseProtected + "/\(accessToken)/patron/barcode?patronid=\(patronID)"
                
            case .basicData(let barcode):
                return basePublic + "/patron/\(barcode)/basicdata"
                
            case .holdRequests(let barcode, let endpoint):
                return basePublic + "/patron/\(barcode)/holdrequests/\(endpoint)"
                
            case .ILLRequests(let barcode):
                return basePublic + "/patron/\(barcode)/illrequests/all"
                
            case .items(let barcode, let endpoint):
                return basePublic + "/patron/\(barcode)/itemsout/\(endpoint)"
                
            case .preferences(let barcode):
                return basePublic + "/patron/\(barcode)/preferences"
                
            case .savedSearches(let barcode):
                return basePublic + "/patron/\(barcode)/savedsearches"
                
            case .search(let query, let resultsPerPage, let page):
                return baseProtected + "/\(accessToken)/search/patrons/boolean?q=\(query)&patronsperpage=\(resultsPerPage)&page=\(page)"
                
            case .updateUsername(let barcode, let username):
                return basePublic + "/patron/\(barcode)/username/\(username)"
                
            case .validate(let barcode):
                return basePublic + "/patron/\(barcode)"
            }
        }
    }
}
