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
    public typealias PatronBasicDataGetCompletionHandler = (_ response: Polaris.Patron.BasicDataResponse?) -> Void
    public typealias PatronHoldRequestsGetCompletionHandler = (_ response: Polaris.Patron.HoldsResponse?) -> Void
    public typealias PatronItemsOutGetCompletionHandler = (_ response: Polaris.Patron.ItemsResponse?) -> Void
    public typealias PatronPreferencesGetCompletionHandler = (_ response: Polaris.Patron.PreferencesResponse?) -> Void
    public typealias PatronSearchCompletionHandler = (_ response: Polaris.Patron.SearchResponse?) -> Void
    
    // MARK: - PatronBasicDataGet
    public static func basicData(barcode: String, completion: @escaping PatronBasicDataGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.basicData(barcode)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.BasicDataResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - PatronHoldRequestsGet
    public static func holdRequests(barcode: String, set: Polaris.HoldRequest.Set, completion: @escaping PatronHoldRequestsGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.holdRequests(barcode, set.string)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.HoldsResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: PatronILLRequestsGet
    
    // MARK: - PatronItemsOutGet
    public static func itemsOut(barcode: String, set: Polaris.Item.Set, completion: @escaping PatronItemsOutGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.items(barcode, set.string)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.ItemsResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // MARK: - PatronPreferencesGet
    public static func preferences(barcode: String, completion: @escaping PatronPreferencesGetCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.preferences(barcode)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.PreferencesResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
        
    // TODO: PatronSavedSearchesGet
    
    // MARK: - PatronSearch
    public static func search(query: String, resultsPerPage results: Int = 5, page: Int = 1, completion: @escaping PatronSearchCompletionHandler) {
        let endpoint = HTTPClient.Endpoint.Patron.search(query, results, page)
        
        HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.SearchResponse.self, authorization: true) { (response, error) in
            DispatchQueue.main.async { completion(response) }
        }
    }
    
    // TODO: PatronUpdateUserName
    // TODO: PatronValidate
    // TODO: Patron_GetBarcodeFromID
    
    public struct Account {
        
        // TODO: PatronAccountGet
        // TODO: PatronAccountPay
        // TODO: PatronAccountPayAll
        // TODO: PatronAccountVoid
        // TODO: PatronAccountCreateCredit
        // TODO: PatronAccountDepositCredit
        // TODO: PatronAccountRefundCredit
        // TODO: PatronAccountCreateTitleList
        // TODO: PatronAccountGetTitleLists
        // TODO: PatronAccountDeleteTitleList
    }
    
    public struct Blocks {

        // MARK: - Typealiases
        public typealias PatronCirculateBlocksGetCompletionHandler = (_ response: Polaris.Patron.Blocks.CirculationResponse?) -> Void
        
        // MARK: - PatronCirculateBlocksGet
        public static func circulation(barcode: String, completion: @escaping PatronCirculateBlocksGetCompletionHandler) {
            let endpoint = HTTPClient.Endpoint.Patron.Blocks.circulation(barcode)
            
            HTTPClient.taskForGETRequest(url: endpoint.url, response: Polaris.Patron.Blocks.CirculationResponse.self, authorization: true) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        // TODO: CreatePatronBlocks
        // TODO: PatronRenewBlocksGet
    }
    
    public struct TitleList {
        
        // TODO: PatronTitleListAddTitle
        // TODO: PatronTitleListCopyTitle
        // TODO: PatronTitleListCopyAllTitles
        // TODO: PatronTitleListGetTitles
        // TODO: PatronTitleListMoveTitle
        // TODO: PatronTitleListDeleteTitle
        // TODO: PatronTitleListDeleteAllTitles
    }
    
    public struct Message {
        
        // TODO: PatronMessagesGet
        // TODO: PatronMessageUpdateStatus
        // TODO: PatronMessageDelete
    }
    
    public struct Registration {
        
        // MARK: - Typealiases
        public typealias PatronRegistrationCreateCompletionHandler = (_ response: Polaris.Patron.Registration.CreateResponse?) -> Void
        public typealias PatronRegistrationUpdateCompletionHandler = (_ response: Polaris.Patron.Registration.UpdateResponse?) -> Void

        // MARK: - PatronRegistrationCreate
        public static func create(request: Polaris.Patron.Registration.CreateRequest, completion: @escaping PatronRegistrationCreateCompletionHandler) {
            let endpoint = HTTPClient.Endpoint.Patron.Registration.create
            let body = request
            
            HTTPClient.taskForPOSTRequest(url: endpoint.url, body: body, response: Polaris.Patron.Registration.CreateResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        // MARK: - PatronRegistrationUpdate
        public static func update(barcode: String, request: Polaris.Patron.Registration.UpdateRequest, completion: @escaping PatronRegistrationUpdateCompletionHandler) {
            let endpoint = HTTPClient.Endpoint.Patron.Registration.update(barcode)
            let body = request
            
            HTTPClient.taskForPUTRequest(url: endpoint.url, body: body, response: Polaris.Patron.Registration.UpdateResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
    }
    
    public struct ReadingHistory {
        
        // TODO: PatronReadingHistoryClear
        // TODO: PatronReadingHistoryGet
    }
}
