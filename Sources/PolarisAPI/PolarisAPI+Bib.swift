//
//  PolarisAPI+Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Bib {
    
    // MARK: - Typealiases
    /// A completion handler indicating that the API call is completed.
    /// - parameter response: A response object containing bibliographic data for the specified record ID. If there was an issue with the request, the response will include an error describing the failure.
    public typealias BibGetCompletionHandler = (_ response: Polaris.Bib.GetResponse?) -> Void
    
    // MARK: - BibGet
    
    /// Returns bibliographic information for a specified record.
    /// - note: PAPI method name: `BibGet`
    /// - parameter ID: The bibliographic ID number.
    /// - parameter completion: The completion handler containing the bibliographic information or an error if the request is not successful.
    
    public static func get(byID ID: Int, completion: @escaping BibGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Bib.get(ID)
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Bib.GetResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: BibBooleanSearch
    // TODO: BibKeywordSearch
    // TODO: BibHoldingsGet
}
