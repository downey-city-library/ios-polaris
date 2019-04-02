//
//  Polaris+Patron.swift
//  Polaris
//
//  Created by Andrew Despres on 3/29/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    public struct Patron {
        
        public static func registrationCreate(patronInfo: RegistrationCreateRequest, completion: @escaping (RegistrationCreateResponse?, Error?) -> Void) {
            let endpoint = Endpoints.registrationCreate
            let body = patronInfo
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: RegistrationCreateResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response, error) }
            }
        }
    }
}
