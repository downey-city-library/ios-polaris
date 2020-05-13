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
    public typealias ItemRenewCompletionHandler = (_ response: Polaris.Item.RenewResponse?) -> Void
    
    // MARK: - ItemRenew
    public static func renew(barcode: String, ID: Int, request: Polaris.Item.RenewRequest, completion: @escaping ItemRenewCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Item.renew(barcode, ID)
        let body = request
        
        HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.Item.RenewResponse.self) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
        
    // TODO: ItemRenewAllForPatron
    // TODO: ItemUpdateBarcode
}
