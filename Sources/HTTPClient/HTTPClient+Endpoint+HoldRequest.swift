//
//  HTTPClient+Endpoint+Hold.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum HoldRequest: PolarisEndpoint {
        
        case activate(String, String)
        case activateAll(String)
        case cancel(String, String)
        case cancelAll(String)
        case create
        case getList(Int, Int, Int)
        case reply(String)
        case suspend(String, String)
        case suspendAll(String)
        
        var string: String {
            switch self {
            case .activate(let barcode, let requestID):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestID)/inactive"
                
            case .activateAll(let barcode):
                return basePublic + "/patron/\(barcode)/holdrequests/0/inactive"
                
            case .cancel(let barcode, let requestID):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestID)/cancelled"
                
            case .cancelAll(let barcode):
                return basePublic + "/patron/\(barcode)/holdrequests/0/cancelled"
                
            case .create:
                return basePublic + "/holdrequest"
                
            case .getList(let branchID, let branchTypeID, let statusID):
                return baseProtected + "/\(Polaris.authenticatedStaffUser?.access?.token ?? "")/circulation/requests/list?branch=\(branchID)&branch-type=\(branchTypeID)&requeststatus=\(statusID)"
                
            case .reply(let requestGUID):
                return basePublic + "/holdrequest/\(requestGUID)"
                
            case .suspend(let barcode, let requestID):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestID)/active"
                
            case .suspendAll(let barcode):
                return basePublic + "/patron/\(barcode)/holdrequests/0/active"
            }
        }
    }
}
