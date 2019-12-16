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
         Authenticate a Patron with the Polaris API. If successful this method will return an AuthenticatedPatron object containing an access token and patron ID. An authenticated patron is required before calling any public method requiring the patron's password. The access token is used in place of the patron's password.
         - parameter barcode: The patron's barcode number.
         - parameter password: The patron's password or account PIN.
         - parameter completion: A boolean indicating success and in cases where authentication fails, an error describing the failure.
         */
        public static func patron(barcode: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
            let endpoint = Endpoints.Authenticate.patron
            let body = AuthenticatePatronRequest(barcode: barcode, password: password)
            
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: AuthenticatedPatron.self) { (response, error) in
                if let response = response {
                    authenticatedPatron = response
                    DispatchQueue.main.async { completion(true, error) }
                } else {
                    DispatchQueue.main.async { completion(false, error) }
                }
            }
        }
        
        /**
         Authenticate a Staff User with the Polaris API. If successful, this method will return an AuthenticatedStaffUser object containing an access token and access secret. An authenticated staff user is required before calling any protected methods.
         - parameter completion: A boolean indicating success and in cases where authentication fails, an error describing the failure.
         */
        public static func staffUser(completion: @escaping (Bool, Error?) -> Void) {
            let configuration = PolarisConfiguration.shared
            
            staffUser(username: configuration.staffUser.username, password: configuration.staffUser.password) { (success, error) in
                completion(success, error)
            }
        }
        
        /**
         Authenticate a Staff User with the Polaris API. If successful, this method will return an AuthenticatedStaffUser object containing an access token and access secret. An authenticated staff user is required before calling any protected methods.
         - parameter username: Staff username
         - parameter password: Staff password
         - parameter completion: A boolean indicating success and in cases where authentication fails, an error describing the failure.
         */
        public static func staffUser(username: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
            let configuration = PolarisConfiguration.shared
            let endpoint = Endpoints.Authenticate.staffUser
            let body = AuthenticateStaffUserRequest(domain: configuration.staffUser.domain, username: username, password: password)
            
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: AuthenticatedStaffUser.self) { (response, error) in
                if let response = response, response.error == nil {
                    authenticatedStaffUser = response
                    DispatchQueue.main.async { completion(true, nil) }
                } else if let response = response, let polarisError = response.error {
                    DispatchQueue.main.async { completion(false, polarisError) }
                } else {
                    DispatchQueue.main.async { completion(false, error) }
                }
            }
        }
    }
}
