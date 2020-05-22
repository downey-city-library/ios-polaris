//
//  HTTPClient+Endpoint+System.swift
//  Polaris
//
//  Created by Andrew Despres on 5/22/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum System: PolarisEndpoint {
        
        case carriers
        case collections
        case datesClosed
        case headingSearch(String, String, Int, Int)
        case limitFilters
        case organizations(String)
        case patronCodes
        case pickupBranches
        case remoteStorageItems(Int, String, String, Int, Int)
        case shelfLocations(Int)
        case sortOptions
        case updateNotification(Int)
        case updatePickupBranchID(String, Int, Int, Int, Int)
        case updateRequestStatus(Int, String, Int?, Int?)
        
        var string: String {
            switch self {
            case .carriers:
                return baseProtected + "/\(accessToken)/sysadmin/mobilephonecarriers"
                
            case .collections:
                return basePublic + "/collections"
                
            case .datesClosed:
                return basePublic + "/datesclosed"
                
            case .headingSearch (let qualifier, let term, let count, let position):
                return basePublic + "/search/headings/\(qualifier)?startpoint=\(term)&numterms=\(count)&preferredpos=\(position)"
                
            case .limitFilters:
                return basePublic + "/limitfilters"
                
            case .organizations(let filter):
                return basePublic + "/organizations/\(filter)"
                
            case .patronCodes:
                return basePublic + "/patroncodes"
                
            case .pickupBranches:
                return basePublic + "/pickupbranches"
                
            case .remoteStorageItems(let branchID, let startDate, let endDate, let maxItems, let listType):
                return baseProtected + "/\(accessToken)/cataloging/remotestorage/items?branch=\(branchID)&startdate=\(startDate)&enddate=\(endDate)&maxitems=\(maxItems)&listtype=\(listType)"
                
            case .shelfLocations(let ID):
                return basePublic + "/shelflocations?orgID=\(ID)"
                
            case .sortOptions:
                return basePublic + "/sortoptions"
                
            case .updateNotification(let typeID):
                return baseProtected + "/\(accessToken)/notification/\(typeID)"
                
            case .updatePickupBranchID(let barcode, let requestID, let userID, let workstationID, let branchID):
                return basePublic + "/patron/\(barcode)/holdrequests/\(requestID)/pickupbranch?userid=\(userID)&wsid=\(workstationID)&pickupbranchid=\(branchID)"
                
            case .updateRequestStatus(let requestID, let action, let itemID, let reason):
                var url = baseProtected + "/\(accessToken)/circulation/requests/\(requestID)/status?action=\(action)"
                if let itemID = itemID { url += "&itemid=\(itemID)" }
                if let reason = reason { url += "&denyreason=\(reason)" }
                return url
            }
        }
    }
}
