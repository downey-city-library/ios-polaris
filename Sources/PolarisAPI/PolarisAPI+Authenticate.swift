//
//  PolarisAPI+Authenticate.swift
//  Polaris
//
//  Created by Andrew Despres on 4/26/20.
//  Copyright © 2020 Downey City Library. All rights reserved.
//

import Foundation

extension PolarisAPI.Authenticate {
    
    // MARK: - Typealiases
    
    /// A response including the success indicator and the potential error.
    /// - parameter success: Was the patron/staff user authenticated successfully?
    /// - parameter error: An optional Error object describing why the authentication failed.
    public typealias AuthenticationResponse = (_ success: Bool, _ error: Error?) -> Void
    
    
    // MARK: - AuthenticatePatron
    
    /// Authenticate a Patron.
    ///
    /// If successful, this method will return an AuthenticatedPatron object containing an access token and patron ID.
    ///
    /// - important: An authenticated patron is required before calling any public method requiring the patron's password. The access token will be used in place of the patron’s password when building the hash for secure patron methods.
    /// - note: PAPI method name: `AuthenticatePatron`
    /// - parameter barcode: The patron's barcode number.
    /// - parameter password: The patron's password or account PIN.
    /// - parameter completion: A response including the success indicator and the potential error.
    
    public static func patron(barcode: String, password: String, completion: @escaping AuthenticationResponse) {
        let endpoint = HTTPClient.Endpoint.Authenticate.patron
        let body = Polaris.Authenticate.PatronRequest(barcode: barcode, password: password)
        
        HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: Polaris.Authenticate.PatronResponse.self) { (response, error) in
            if let response = response {
                Polaris.authenticatedPatron = response
                DispatchQueue.main.async { completion(true, error) }
            } else {
                DispatchQueue.main.async { completion(false, error) }
            }
        }
    }
    
    // MARK: - AuthenticateStaffUser
    
    /// Authenticate a Staff User.
    ///
    /// If successful, this method will return an AuthenticatedStaffUser object containing an access token and access secret.
    ///
    /// - important: An authenticated staff user is required before calling any protected methods.
    /// - note: PAPI method name: `AuthenticateStaffUser`
    /// - parameter completion: A response including the success indicator and the potential error.
    
    public static func staffUser(completion: @escaping AuthenticationResponse) {
        let configuration = PolarisConfiguration.shared
        
        staffUser(username: configuration.staffUser.username, password: configuration.staffUser.password) { (success, error) in
            completion(success, error)
        }
    }
    
    /// Authenticate a Staff User.
    ///
    /// If successful, this method will return an AuthenticatedStaffUser object containing an access token and access secret.
    ///
    /// - important: An authenticated staff user is required before calling any protected methods.
    /// - note: PAPI method name: `AuthenticateStaffUser`
    /// - parameter username: Staff username
    /// - parameter password: Staff password
    /// - parameter completion: A response including the success indicator and the potential error.
    
    public static func staffUser(username: String, password: String, completion: @escaping AuthenticationResponse) {
        let configuration = PolarisConfiguration.shared
        let endpoint = HTTPClient.Endpoint.Authenticate.staffUser
        let body = Polaris.Authenticate.StaffRequest(domain: configuration.staffUser.domain, username: username, password: password)

        HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: Polaris.Authenticate.StaffResponse.self) { (response, error) in
            if let response = response, response.error == nil {
                Polaris.authenticatedStaffUser = response
                DispatchQueue.main.async { completion(true, nil) }
            } else if let response = response, let polarisError = response.error {
                DispatchQueue.main.async { completion(false, polarisError) }
            } else {
                DispatchQueue.main.async { completion(false, error) }
            }
        }
    }
}
