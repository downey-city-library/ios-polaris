//
//  PolarisAPI+Hold.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.HoldRequest {
    
    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `HoldRequestCreate` is completed.
    /// - parameter response: An object containing a response message for the hold request. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias HoldRequestCreateCompletionHandler = (_ response: Polaris.HoldRequest.CreateResponse?) -> Void
    
    // TODO: HoldRequestActivate
    // TODO: HoldRequestActivateAllForPatron
    // TODO: HoldRequestCancel
    // TODO: HoldRequestCancelAllForPatron
    
    // MARK: - HoldRequestCreate
    
    /// Start the local hold request process.
    /// - important: This process is based on a “messaging” system and will allow a Polaris patron to place a local hold request. After calling the `create` method, one or more calls to the `reply` method may be required. The message exchange is complete when a StatusType of Error (1) or Answer (2) is returned or if an error is raised by a database exception.
    /// - note: PAPI method name: `HoldRequestCreate`
    /// - parameter request: The object to be POSTed containing the patron barcode, biographic ID among various other properties.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func create(_ request: Polaris.HoldRequest.CreateRequest, completion: @escaping HoldRequestCreateCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.HoldRequest.create
        let body = request
        
        HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: Polaris.HoldRequest.CreateResponse.self) { (response, error) in
            print("completion handler for taskForPostRequest:")
            print("response:", response as Any)
            print("error:", error as Any)
            
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: HoldRequestGetList
    // TODO: HoldRequestReply
    // TODO: HoldRequestSuspend
    // TODO: HoldRequestSuspendAllForPatron
}
