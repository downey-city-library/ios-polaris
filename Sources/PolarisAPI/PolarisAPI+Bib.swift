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
    /// A completion handler indicating that the API call to `BibGet` is completed.
    /// - parameter response: A response object containing bibliographic data for the specified record ID. If there was an issue with the request, the response will include an error describing the failure.
    public typealias BibGetCompletionHandler = (_ response: Polaris.Bib.GetResponse?) -> Void
    
    /// A completion handler indicating that the API call to`BibHoldingsGet` is completed.
    /// - parameter response: A response object containing holdings data for the specified bibliographic record ID. If there was an issue with the request, the response will include an error describing the failure.
    public typealias BibHoldingsGetCompletionHandler = (_ response: Polaris.Bib.GetHoldingsResponse?) -> Void
    
    // TODO: BibBooleanSearch
    
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
        
    // MARK: - BibHoldingsGet
    
    /// Returns the holdings for a specified bibliographic record.
    /// - note: PAPI method name: `BibHoldingsGet`
    /// - parameter ID: The bibliographic ID number.
    /// - parameter completion: The completion handler containting the holdings information or an error if the request is not successful.
    
    public static func getHoldings(forBib ID: Int, completion: @escaping BibHoldingsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Bib.getHoldings(ID)
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Bib.GetHoldingsResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: BibKeywordSearch

}
