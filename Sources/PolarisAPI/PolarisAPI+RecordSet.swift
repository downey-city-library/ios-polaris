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
    
    /// A completion handler indicating that the API call to `RecordSetRecordsGet` is completed.
    /// - parameter response: An object containing a list of patrons. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias RecordSetRecordsGetCompletionHandler = (_ response: Polaris.RecordSet.GetResponse?) -> Void
    
    /// A completion handler indicating that the API call to `RecordSetContentPut` is completed.
    /// - parameter response: If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias RecordSetContentPutCompletionHandler = (_ response: Polaris.RecordSet.PutResponse?) -> Void
        
    // MARK: - RecordSetRecordsGet
    
    /// Returns a list of record IDs in a specified patron record set.
    /// - note: PAPI method name: `RecordSetRecordsGet`
    /// - parameter recordSetID: The ID of the patron record set.
    /// - parameter userID: The ID of the staff member making the request.
    /// - parameter workstationID: The ID of the workstation being used to generate the request.
    /// - parameter startIndex: The first patron record to be returned, relative to the beginning of the record set.
    /// - parameter records: The total number of records to return.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func get(_ recordSetID: Int, userID: Int, workstationID: Int, startIndex: Int = 0, records: Int = 1000, completion: @escaping RecordSetRecordsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.get(recordSetID, userID, workstationID, startIndex, records)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.RecordSet.GetResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - RecordSetContentPut (Add)
    
    /// Adds records to a patron record set.
    /// - note: PAPI method name: `RecordSetContentPut`
    /// - parameter request: The request object containing a list of Patron IDs to add.
    /// - parameter recordSetID: The ID of the patron record set.
    /// - parameter userID: The ID of the staff member making the request.
    /// - parameter workstationID: The ID of the workstation being used to generate the request.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func add(request: Polaris.RecordSet.PutRequest, from recordSetID: Int, userID: Int, workstationID: Int, completion: @escaping RecordSetContentPutCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.add(recordSetID, userID, workstationID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.RecordSet.PutResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - RecordSetContentPut (Remove)
    
    /// Removes records from a patron record set.
    /// - note: PAPI method name: `RecordSetContentPut`
    /// - parameter request: The request object containing a list of Patron IDs to remove.
    /// - parameter recordSetID: The ID of the patron record set.
    /// - parameter userID: The ID of the staff member making the request.
    /// - parameter workstationID: The ID of the workstation being used to generate the request.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func remove(request: Polaris.RecordSet.PutRequest, from recordSetID: Int, userID: Int, workstationID: Int, completion: @escaping RecordSetContentPutCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.RecordSet.remove(recordSetID, userID, workstationID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.RecordSet.PutResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
}
