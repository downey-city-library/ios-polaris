//
//  PolarisAPI+Patron+Registration.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Patron.Registration {
    
    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `PatronRegistrationCreate` is completed.
    /// - parameter response: An object containing a registration response. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronRegistrationCreateCompletionHandler = (_ response: Polaris.Patron.Registration.CreateResponse?) -> Void
    
    /// A completion handler indicating that the API call to `PatronRegistrationUpdate` is completed.
    /// - parameter response: An object containing a registration update response. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronRegistrationUpdateCompletionHandler = (_ response: Polaris.Patron.Registration.UpdateResponse?) -> Void

    // MARK: - PatronRegistrationCreate
    
    /// Create a new patron registration record. Basic patron duplicate detection (name, username, barcode) is performed.
    /// - note: PAPI method name: `PatronRegistrationCreate`
    /// - parameter request: The registration object containing patron data.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func create(request: Polaris.Patron.Registration.CreateRequest, completion: @escaping PatronRegistrationCreateCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.Registration.create
        let body = request
        
        HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: Polaris.Patron.Registration.CreateResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - PatronRegistrationUpdate
    
    /// Update Patron Registration information.
    /// - note: PAPI method name: `PatronRegistrationUpdate`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter request: The registration object containing patron data.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func update(barcode: String, request: Polaris.Patron.Registration.UpdateRequest, completion: @escaping PatronRegistrationUpdateCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.Registration.update(barcode)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.Patron.Registration.UpdateResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
}
