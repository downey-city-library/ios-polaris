//
//  PolarisAPI+Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Patron {
    
    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `PatronBasicDataGet` is completed.
    /// - parameter response: An object containing basic patron data. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronBasicDataGetCompletionHandler = (_ response: Polaris.Patron.BasicDataResponse?) -> Void
    
    /// A completion handler indicating that the API call to `PatronHoldRequestsGet` is completed.
    /// - parameter response: An object containing hold requests for a specific patron. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronHoldRequestsGetCompletionHandler = (_ response: Polaris.Patron.HoldsResponse?) -> Void
    
    /// A completion handler indicating that the API call to `PatronItemsOutGet` is completed.
    /// - parameter response: An object containing items checked out to a specific patron. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronItemsOutGetCompletionHandler = (_ response: Polaris.Patron.ItemsResponse?) -> Void
    
    /// A completion handler indicating that the API call to `PatronPreferencesGet` is completed.
    /// - parameter response: An object containing preferences for a specific patron. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronPreferencesGetCompletionHandler = (_ response: Polaris.Patron.PreferencesResponse?) -> Void
    
    /// A completion handler indicating that the API call to `PatronSearch` is completed.
    /// - parameter response: An object containing a list of patrons. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias PatronSearchCompletionHandler = (_ response: Polaris.Patron.SearchResponse?) -> Void
    
    // MARK: - PatronBasicDataGet
    
    /// Returns basic name, address, circulation counts, and account balances for a patron.
    /// - note: PAPI method name: `PatronBasicDataGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func basicData(barcode: String, completion: @escaping PatronBasicDataGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.basicData(barcode)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.BasicDataResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - PatronHoldRequestsGet
    
    /// Returns a list of hold requests placed by the specified patron. The list can be filtered by all hold requests or by the request status.
    /// - note: PAPI method name: `PatronHoldRequestsGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter set: The status of the holds to be returned.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func holdRequests(barcode: String, set: Polaris.HoldRequest.Set, completion: @escaping PatronHoldRequestsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.holdRequests(barcode, set.string)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.HoldsResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: TODO - PatronILLRequestsGet
    
    // MARK: - PatronItemsOutGet
    
    /// Returns list of items out to the specified patron.
    /// - important: The list can be filtered by `ALL` items out, `OVERDUE` items only, or `LOST` items only.
    /// - note: PAPI method name: `PatronItemsOutGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter set: The status of the items to be returned.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func itemsOut(barcode: String, set: Polaris.Item.Set, completion: @escaping PatronItemsOutGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.items(barcode, set.string)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.ItemsResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - PatronPreferencesGet
    
    /// Return preferences for a patron including reading list, email format, and notification type.
    /// - note: PAPI method name: `PatronPreferencesGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func preferences(barcode: String, completion: @escaping PatronPreferencesGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.preferences(barcode)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.PreferencesResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
        
    // TODO: TODO - PatronSavedSearchesGet
    
    // MARK: - PatronSearch
    
    /// This protected method returns a list of patrons that match the search criteria specified in the CCL submitted by the user. Data returned includes the patron’s name, barcode, Polaris Patron ID, and Polaris Organization ID. This method offers query parameters that allow the user to specify the number of patrons, the sort order, and page of data to retrieve.
    /// - important: A call to AuthenticateStaffUser is required before calling any protected method.
    /// - note: PAPI method name: `PatronSearch`
    /// - parameter query: Common Command Language (CCL) snippet. Must be URL encoded.
    /// - parameter results: Maximum number of patrons to return default is 5.
    /// - parameter page: Page number - default is 1.
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func search(query: String, resultsPerPage results: Int = 5, page: Int = 1, completion: @escaping PatronSearchCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.search(query, results, page)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.SearchResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: TODO - PatronUpdateUserName
    // TODO: TODO - PatronValidate
    // TODO: TODO - Patron_GetBarcodeFromID
    
    public struct Account {}
    
    public struct Blocks {}
    
    public struct Message {}

    public struct ReadingHistory {}
    
    public struct Registration {}
    
    public struct TitleList {}
}
