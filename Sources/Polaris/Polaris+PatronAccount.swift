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
        public static func cancelHoldRequest(barcode: String, request: CancelHoldRequest, requestId: Int, userId: Int, workstationId: Int, completion: @escaping (CancelHoldResponse?) -> Void) {
            let endpoint = Endpoints.Patron.cancelHoldRequest(barcode, requestId, workstationId, userId)
            let body = request
            HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: CancelHoldResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func createRegistration(patronInfo: CreateRegistrationRequest, completion: @escaping (CreateRegistrationResponse?) -> Void) {
            let endpoint = Endpoints.Patron.createRegistration
            let body = patronInfo
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: CreateRegistrationResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getBasicData(barcode: String, completion: @escaping (GetBasicDataResponse?) -> Void) {            
            let endpoint = Endpoints.Patron.getBasicData(barcode)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetBasicDataResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getCirculationBlocks(barcode: String, completion: @escaping (GetCirculationBlocksResponse?) -> Void) {
            let endpoint = Endpoints.Patron.getCirculationBlocks(barcode)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetCirculationBlocksResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getHoldRequests(barcode: String, holdRequestSet: HoldRequestSet, completion: @escaping (GetHoldRequestsResponse?) -> Void) {
            let endpoint = Endpoints.Patron.getHoldRequests(barcode, holdRequestSet)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetHoldRequestsResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getItemsOut(barcode: String, itemSet: ItemSet, completion: @escaping (GetItemsOutResponse?) -> Void) {
            let endpoint = Endpoints.Patron.getItemsOut(barcode, itemSet)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetItemsOutResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func getPreferences(barcode: String, completion: @escaping (GetPreferencesResponse?) -> Void) {
            let endpoint = Endpoints.Patron.getPreferences(barcode)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetPreferencesResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func renewItem(barcode: String, itemId: Int, request: RenewItemRequest, completion: @escaping (RenewItemResponse?) -> Void) {
            let endpoint = Endpoints.Patron.renewItem(barcode, itemId)
            let body = request
            HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: RenewItemResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func search(query: String, resultsPerPage results: Int = 5, page: Int = 1, completion: @escaping (PatronSearchResponse?) -> Void) {
            let endpoint = Endpoints.Patron.search(query, results, page)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: PatronSearchResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func update(barcode: String, request: UpdatePatronRequest, completion: @escaping (UpdatePatronResponse?) -> Void) {
            let endpoint = Endpoints.Patron.update(barcode)
            let body = request
            HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: UpdatePatronResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
    }
}
