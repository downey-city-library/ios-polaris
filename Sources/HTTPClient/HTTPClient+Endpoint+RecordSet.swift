//
//  HTTPClient+Endpoint+RecordSet.swift
//  Polaris
//
//  Created by Andrew Despres on 5/17/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension HTTPClient.Endpoint {
    
    enum RecordSet: PolarisEndpoint {
    
        case add(Int, Int, Int)
        case get(Int, Int, Int, Int, Int)
        case remove(Int, Int, Int)
        
        var string: String {
            switch self {
            case .add(let recordSetID, let userID, let workstationID):
                return HTTPClient.Endpoint.baseProtected + "/\(accessToken)/recordsets/\(recordSetID)?userid=\(userID)&wsid=\(workstationID)&action=add"
                
            case .get(let recordSetID, let userID, let workstationID, let startIndex, let numRecords):
                return HTTPClient.Endpoint.baseProtected + "/\(accessToken)/recordsets/\(recordSetID)/records?userid=\(userID)&wsid=\(workstationID)&startIndex=\(startIndex)&numRecords=\(numRecords)"
            
            case .remove(let recordSetID, let userID, let workstationID):
                return HTTPClient.Endpoint.baseProtected + "/\(accessToken)/recordsets/\(recordSetID)?userid=\(userID)&wsid=\(workstationID)&action=remove"
            }
        }
    }
}
