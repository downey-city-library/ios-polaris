//
//  Polaris+Bib.swift
//  Polaris
//
//  Created by Andrew Despres on 3/12/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

extension Polaris {
    public struct Bib {
        
        // MARK: - Public Methods
//        /**
//         Returns bibliographic information for a specified record.
//         - parameter id: The Bib ID number.
//         - parameter completion: The completion handler containing the bibliographic information or an error if the request is not successful.
//         */
//        public static func get(byID id: Int, completion: @escaping (GetBibResponse?) -> Void) {
//            let endpoint = Endpoints.Bib.get(id)
//            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetBibResponse.self) { (response, error) in
//                DispatchQueue.main.async { completion(response) }
//            }
//        }
        
        /**
         Returns the holdings for a specified bibliographic record.
         - parameter id: The Bib ID number.
         - parameter completion: The completion handler containting the holdings information or an error if the request is not successful.
         */
        public static func getHoldings(forBib id: Int, completion: @escaping (GetBibHoldingsResponse?) -> Void) {
            let endpoint = Polaris.Endpoints.Bib.getHoldings(id)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: GetBibHoldingsResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func keywordSearch(qualifier: KeywordQualifier, query: String, completion: @escaping (KeywordSearchResponse?) -> Void) {
            let endpoint = Polaris.Endpoints.Bib.keywordSearch(qualifier, query)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: KeywordSearchResponse.self) { (response, error) in
                DispatchQueue.main.async { completion(response) }
            }
        }
        
        public static func search() {
            print("bibSearch")
        }
    }
}
