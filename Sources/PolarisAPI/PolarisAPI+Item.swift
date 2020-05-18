//
//  PolarisAPI+Item.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Item {
    
    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `ItemRenew` is completed.
    /// - parameter response: An object containing a renew response. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias ItemRenewCompletionHandler = (_ response: Polaris.Item.RenewResponse?) -> Void
    
    // MARK: - ItemRenew
    
    /// Attempt to renew an item that is already checked out.
    /// - note: PAPI method name: `ItemRenew`
    /// - parameter barcode: The barcode of the patron requesting the renewal.
    /// - parameter ID: The record ID of the item being renewed.
    /// - parameter request: The renewal request object.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func renew(barcode: String, ID: Int, request: Polaris.Item.RenewRequest, completion: @escaping ItemRenewCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Item.renew(barcode, ID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.Item.RenewResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
        
    // TODO: TODO - ItemRenewAllForPatron
    // TODO: TODO - ItemUpdateBarcode
}
