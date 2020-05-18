//
//  PolarisAPI+Patron+Blocks.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Patron.Blocks {

    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `PatronCirculateBlocksGet` is completed.
    /// - parameter response: An object containing circulation blocks for a specified patron. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronCirculateBlocksGetCompletionHandler = (_ response: Polaris.Patron.Blocks.CirculationResponse?) -> Void
    
    // MARK: - PatronCirculateBlocksGet
    
    /// Validate that a patron is part of the Polaris database, and return blocks and status telling the caller if the given patron is allowed to perform a circulation activity (checkout).
    /// - note: PAPI method name: `PatronCirculateBlocksGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func circulation(barcode: String, completion: @escaping PatronCirculateBlocksGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.Blocks.circulation(barcode)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.Blocks.CirculationResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: TODO - CreatePatronBlocks
    // TODO: TODO - PatronRenewBlocksGet
}
