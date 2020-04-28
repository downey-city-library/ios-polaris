//
//  Polaris+Endpoints.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    
    typealias PolarisPatron = Patron
    
    internal enum Endpoints {
        
        fileprivate static let basePublic = PolarisConfiguration.shared.url.public
        fileprivate static let baseProtected = PolarisConfiguration.shared.url.protected
    }
}

// MARK: - Endpoints + Patron
extension Polaris.Endpoints {
    
    internal enum Patron {
        
        case cancelHoldRequest(String, Int, Int, Int)
        case createRegistration
        case getBasicData(String)
        case getCirculationBlocks(String)
        case getHoldRequests(String, Polaris.PolarisPatron.HoldRequestSet)
        case getItemsOut(String, Polaris.PolarisPatron.ItemSet)
        case getPreferences(String)
        case renewItem(String, Int)
        case search(String, Int, Int)
        case update(String)
        
        internal var stringValue: String {
            switch self {
            case .cancelHoldRequest(let barcode, let requestId, let wsid, let userid):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestId)/cancelled?wsid=\(wsid)&userid=\(userid)"
            case .createRegistration:
                return basePublic + "/patron"
            case .getBasicData (let barcode):
                return basePublic + "/patron/\(barcode)/basicdata?addresses=1"
            case .getCirculationBlocks (let barcode):
                return basePublic + "/patron/\(barcode)/circulationblocks"
            case .getHoldRequests(let barcode, let holdRequestsSet):
                return basePublic + "/patron/\(barcode)/holdrequests/\(holdRequestsSet.string)"
            case .getItemsOut(let barcode, let itemSet):
                return basePublic + "/patron/\(barcode)/itemsout/\(itemSet.string)"
            case .getPreferences (let barcode):
                return basePublic + "/patron/\(barcode)/preferences"
            case .renewItem(let barcode, let itemId):
                return basePublic + "/patron/\(barcode)/itemsout/\(itemId)"
            case .search(let query, let results, let page):
                return baseProtected + "/\(Polaris.authenticatedStaffUser?.access?.token ?? "")/search/patrons/boolean?q=\(query)&patronsperpage=\(results)&page=\(page)"
            case .update(let barcode):
                return basePublic + "/patron/\(barcode)"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}
