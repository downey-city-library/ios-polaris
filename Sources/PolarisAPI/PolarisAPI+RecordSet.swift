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
    public typealias RecordSetContentPutCompletionHandler = (_ response: Polaris.RecordSet.PutResponse?) -> Void
    
    // TODO: RecordSetContentPut
    
    // MARK: - RecordSetRecordsGet
    public static func get(_ recordSetID: Int, userID: Int, workstationID: Int, startIndex: Int = 0, records: Int = 1000, completion: @escaping RecordSetRecordsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.get(recordSetID, userID, workstationID, startIndex, records)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.RecordSet.GetResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - RecordSetContentPut (Add)
    public static func add(request: Polaris.RecordSet.PutRequest, from recordSetID: Int, userID: Int, workstationID: Int, completion: @escaping RecordSetContentPutCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.add(recordSetID, userID, workstationID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.RecordSet.PutResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - RecordSetContentPut (Remove)
    public static func remove(request: Polaris.RecordSet.PutRequest, from recordSetID: Int, userID: Int, workstationID: Int, completion: @escaping RecordSetContentPutCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.remove(recordSetID, userID, workstationID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.RecordSet.PutResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
}
