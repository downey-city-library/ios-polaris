//
//  Polaris+PatronAccount.swift
//  Polaris
//
//  Created by Andrew Despres on 3/29/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    
    public struct PatronAccount {
        
        // MARK: - Typealiases
        public typealias HoldRequestSet = Patron.HoldRequestSet
        public typealias ItemSet = Patron.ItemSet
        
        // MARK: - Public Methods
        public static func getBasicData(barcode: String, completion: @escaping (GetBasicDataResponse?) -> Void) {            
            let endpoint = Endpoints.getBasicData(barcode)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetBasicDataResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getHoldRequests(barcode: String, holdRequestSet: HoldRequestSet, completion: @escaping (GetHoldRequestsResponse?) -> Void) {
            let endpoint = Endpoints.getHoldRequests(barcode, holdRequestSet)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetHoldRequestsResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getItemsOut(barcode: String, itemSet: ItemSet, completion: @escaping (GetItemsOutResponse?) -> Void) {
            let endpoint = Endpoints.getItemsOut(barcode, itemSet)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetItemsOutResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getPreferences(barcode: String, completion: @escaping (GetPreferencesResponse?) -> Void) {
            let endpoint = Endpoints.getPreferences(barcode)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetPreferencesResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func createRegistration(patronInfo: CreateRegistrationRequest, completion: @escaping (CreateRegistrationResponse?) -> Void) {
            let endpoint = Endpoints.registrationCreate
            let body = patronInfo
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: CreateRegistrationResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
//        public static func update(barcode: String, patron: UpdatePatronRequest, completion: @escaping (UpdatePatronResponse?, Error?) -> Void) {
//            let endpoint = Endpoints.updatePatron(barcode)
//            let body = patron
//            HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: UpdatePatronResponse.self) { (response, error) in
//                DispatchQueue.main.async { completion(response, error) }
//            }
//        }
    }
}
