//
//  PolarisAPI+RecordSet.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.RecordSet {
    
    // MARK: - Typealiases
    public typealias RecordSetRecordsGetCompletionHandler = (_ response: Polaris.RecordSet.GetResponse?) -> Void
    
    // TODO: RecordSetContentPut
    
    // MARK: - RecordSetRecordsGet
    public static func get(_ recordSetID: Int, userID: Int, workstationID: Int, startIndex: Int = 0, records: Int = 1000, completion: @escaping RecordSetRecordsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.get(recordSetID, userID, workstationID, startIndex, records)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.RecordSet.GetResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
}
