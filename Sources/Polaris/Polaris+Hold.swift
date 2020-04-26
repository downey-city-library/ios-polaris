//
//  Polaris+Hold.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    
    public struct Hold {
        
        // MARK: - Public Methods
        public static func create(_ request: CreateHoldRequest, completion: @escaping (CreateHoldResponse?) -> Void) {
            print("creating hold request")
            
            let endpoint = Endpoints.Hold.create
            print("endpoint:", endpoint.stringValue)
            
            let body = request
            print("request:", request)
            
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: CreateHoldResponse.self) { (response, error) in
                print("completion handler for taskForPostRequest:")
                print("response:", response)
                print("error:", error)
                
                DispatchQueue.main.async { completion(response) }
            }
        }
    }
}
