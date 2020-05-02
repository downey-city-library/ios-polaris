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
    
    /// A completion handler indicating that the API call to `HoldRequestCancel` is completed.
    /// - parameter response: An object containing a response message for the cancel request. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias HoldRequestCancelCompletionHandler = (_ response: Polaris.HoldRequest.CancelResponse?) -> Void
    
    /// A completion handler indicating that the API call to `HoldRequestCreate` is completed.
    /// - parameter response: An object containing a response message for the hold request. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias HoldRequestCreateCompletionHandler = (_ response: Polaris.HoldRequest.CreateResponse?) -> Void
    
    /// A completion handler indicating that the API call to `HoldRequestGetList` is completed.
    /// - parameter response: An object containing a list of hold requests. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias HoldRequestGetListCompletionHander = (_ response: Polaris.HoldRequest.GetListResponse?) -> Void
    
    // TODO: HoldRequestActivate
    // TODO: HoldRequestActivateAllForPatron
    
    // MARK: - HoldRequestCancel
    
    /// Cancel a single hold request for a specific patron.
    /// - note: The following hold statuses can be cancelled:
    ///   - 1 - inactive
    ///   - 2 - active
    ///   - 4 - pending
    ///   - 5 - shipped (if enabled by the library)
    /// - note: PAPI method name: `HoldRequestCancel`
    /// - parameter barcode: The barcode of the patron with the hold request.
    /// - parameter requestID: The hold request ID number.
    /// - parameter userID: The ID of the staff member making the cancel request.
    /// - parameter workstationID: The ID of the workstation being used to generate the request.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func cancel(barcode: String, requestID: Int, userID: Int, workstationID: Int, completion: @escaping HoldRequestCancelCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.HoldRequest.cancel(barcode, requestID, workstationID, userID)
        HTTPClient.taskForPUTRequest(url: endpoint.url, response: Polaris.HoldRequest.CancelResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - HoldRequestCancelAllForPatron
    
    /// Cancel all hold requests for a specific patron.
    /// - note: The following hold statuses can be cancelled:
    ///   - 1 - inactive
    ///   - 2 - active
    ///   - 4 - pending
    ///   - 5 - shipped (if enabled by the library)
    /// - note: PAPI method name: `HoldRequestCancelAllForPatron`
    /// - parameter barcode: The barcode of the patron with the hold request.
    /// - parameter userID: The ID of the staff member making the cancel request.
    /// - parameter workstationID: The ID of the workstation being used to generate the request.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func cancelAll(barcode: String, userID: Int, workstationID: Int, completion: @escaping HoldRequestCancelCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.HoldRequest.cancelAll(barcode, workstationID, userID)
        HTTPClient.taskForPUTRequest(url: endpoint.url, response: Polaris.HoldRequest.CancelResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
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
    
    // MARK: - HoldRequestGetList
    
    /// Returns a list of hold requests that match the criteria specified by the user. The data returned includes the detailed request, patron, item, and title information.
    /// - note: PAPI method name: `HoldRequestGetList`
    /// - parameter branchID: The branch ID for the request list.
    /// - parameter branchType: The type of branch specified. Valid values include: 1 - Patron's Branch; 2 - Pickup Branch; 3 - Item Branch.
    /// - parameter requestStatus: The desired status of requests returned.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func getList(branchID: Int, branchType: Int, requestStatus: Int, completion: @escaping HoldRequestGetListCompletionHander) {
        let endpoint = HTTPClient.Endpoint.HoldRequest.getList(branchID, branchType, requestStatus)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.HoldRequest.GetListResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: HoldRequestReply
    // TODO: HoldRequestSuspend
    // TODO: HoldRequestSuspendAllForPatron
}
