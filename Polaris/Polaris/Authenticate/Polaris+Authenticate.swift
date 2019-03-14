//
//  Polaris+Authenticate.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    public struct Authenticate {
        
        /**
         Authenticate a Staff User with the Polaris API. If successful, this method will return an AuthenticatedStaffUser object containing an access token and access secret. An authenticated staff user is required before calling any protected methods.
         - parameter completion: A boolean indicating success and in cases where authentication fails, an error describing the failure.
         */
        public static func staffUser(completion: @escaping (Bool, Error?) -> Void) {
            let configuration = PolarisConfiguration.shared
            let endpoint = Endpoints.authenticateStaffUser
            let body = AuthenticateStaffUserRequest(domain: configuration.staffUser.domain, username: configuration.staffUser.username, password: configuration.staffUser.password)
            
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: AuthenticatedStaffUser.self) { (response, error) in
                if let response = response {
                    authenticatedStaffUser = response
                    DispatchQueue.main.async { completion(true, error) }
                } else {
                    DispatchQueue.main.async { completion(false, error) }
                }
            }
        }
    }
}
