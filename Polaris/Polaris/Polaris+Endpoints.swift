//
//  Polaris+Endpoints.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    internal enum Endpoints {
        fileprivate static let basePublic = PolarisConfiguration.shared.url.public
        fileprivate static let baseProtected = PolarisConfiguration.shared.url.protected
        
        // Authenticate
        case authenticatePatron
        case authenticateStaffUser
        
        // Bib
        case bibGet(Int)
        
        // Patron
        case getBasicData(String)
        case getHoldRequests(String, Patron.HoldRequestSet)
        case getItemsOut(String, Patron.ItemSet)
        case getItemsOutAll(String)
        case getItemsOutOverdue(String)
        case getItemsOutLost(String)
        case getPreferences(String)
        case registrationCreate
        case updatePatron(String)
        
        internal var stringValue: String {
            switch self {
            // Authenticate
            case .authenticatePatron:
                return Endpoints.basePublic + "/authenticator/patron"
            case .authenticateStaffUser:
                return Endpoints.baseProtected + "/authenticator/staff"
                
            // Bib
            case .bibGet (let bibID):
                return Endpoints.basePublic + "/bib/\(bibID)"
            
            // Patron
            case .getBasicData (let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)/basicdata?addresses=1"
            case .getHoldRequests(let barcode, let holdRequestsSet):
                return Endpoints.basePublic + "/patron/\(barcode)/holdrequests/\(holdRequestsSet.string)"
            case .getItemsOut(let barcode, let itemSet):
                return Endpoints.basePublic + "/patron/\(barcode)/itemsout/\(itemSet.string)"
            case .getItemsOutAll (let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)/itemsout/all"
            case .getItemsOutOverdue (let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)/itemsout/overdue"
            case .getItemsOutLost (let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)/itemsout/lost"
            case .getPreferences (let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)/preferences"
            case .registrationCreate:
                return Endpoints.basePublic + "/patron"
            case .updatePatron(let barcode):
                return Endpoints.basePublic + "/patron/\(barcode)"
            }
        }
        
        internal var url: URL {
            return URL(string: stringValue)!
        }
    }
}
