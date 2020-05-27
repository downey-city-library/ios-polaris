//
//  PolarisAPI+System.swift
//  Polaris
//
//  Created by Andrew Despres on 5/22/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.System {
    
    // MARK: - Typealiases
    
    /// A completion handler indicating that the API call to `SAMobilePhoneCarriersGetResult` is completed.
    /// - parameter response: An object containing a list of phone carriers. If there was an issue with the request, the response will include an error describing the failure.
    
    public typealias SAMobilePhoneCarriersGetResultCompletionHandler = (_ response: Polaris.System.CarriersResponse?) -> Void
    
    // TODO: TODO - HeadingsSearch
    // TODO: TODO - CollectionsGet
    // TODO: TODO - DatesClosed
    // TODO: TODO - LimitFiltersGet
    // TODO: TODO - NotificationUpdate
    // TODO: TODO - OrganizationsGet
    // TODO: TODO - PickupBranchesGet
    // TODO: TODO - PatronCodesGetResult
    // TODO: TODO - ShelfLocationsGet
    // TODO: TODO - RemoteStorageItemsGet
    
    // MARK: - SAMobilePhoneCarriersGetResult
    
    /// Returns content from the SA_MobilePhoneCarriers table for a specified organization, which specifies the mobile phone carrier selections available for patron record phone fields.
    /// - note: PAPI method name: `SAMobilePhoneCarriersGetResult`
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func carriers(completion: @escaping SAMobilePhoneCarriersGetResultCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.System.carriers
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.System.CarriersResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: TODO - SortOptionsGet
    // TODO: TODO - UpdatePickupBranchID
    // TODO: TODO - RequestsUpdateStatus
}
