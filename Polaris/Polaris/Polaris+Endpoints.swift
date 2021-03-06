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

// MARK: - Endpoints + Authenticate
extension Polaris.Endpoints {
    
    internal enum Authenticate {
        
        case patron
        case staffUser
        
        internal var stringValue: String {
            switch self {
                case .patron:
                    return basePublic + "/authenticator/patron"
                case .staffUser:
                    return baseProtected + "/authenticator/staff"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}

// MARK: - Endpoints + Bib
extension Polaris.Endpoints {
    
    internal enum Bib {
        
        case get(Int)
        case getHoldings(Int)
            
        internal var stringValue: String {
            switch self {
            case .get(let bibId):
                return basePublic + "/bib/\(bibId)"
            case .getHoldings(let bibId):
                return basePublic + "/bib/\(bibId)/holdings"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}

// MARK: - Endpoints + Patron
extension Polaris.Endpoints {
    
    internal enum Patron {
        
        case cancelHoldRequest(String, Int, Int, Int)
        case createRegistration
        case getBasicData(String)
        case getHoldRequests(String, Polaris.PolarisPatron.HoldRequestSet)
        case getItemsOut(String, Polaris.PolarisPatron.ItemSet)
        case getPreferences(String)
        case renewItem(String, Int)
        case update(String)
        
        internal var stringValue: String {
            switch self {
            case .cancelHoldRequest(let barcode, let requestId, let wsid, let userid):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestId)/cancelled?wsid=\(wsid)&userid=\(userid)"
            case .createRegistration:
                return basePublic + "/patron"
            case .getBasicData (let barcode):
                return basePublic + "/patron/\(barcode)/basicdata?addresses=1"
            case .getHoldRequests(let barcode, let holdRequestsSet):
                return basePublic + "/patron/\(barcode)/holdrequests/\(holdRequestsSet.string)"
            case .getItemsOut(let barcode, let itemSet):
                return basePublic + "/patron/\(barcode)/itemsout/\(itemSet.string)"
            case .getPreferences (let barcode):
                return basePublic + "/patron/\(barcode)/preferences"
            case .renewItem(let barcode, let itemId):
                return basePublic + "/patron/\(barcode)/itemsout/\(itemId)"
            case .update(let barcode):
                return basePublic + "/patron/\(barcode)"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}
