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
        
        /**
         Returns bibliographic information for a specified record.
         - parameter id: The Bib ID number.
         - parameter completion: The completion handler containing the bibliographic information or an error if the request is not successful.
         */
        public static func get(byID id: Int, completion: @escaping (BibInfo?, Error?) -> Void) {
            let endpoint = Endpoints.bibGet(id)
            HTTPClient.taskForGETRequest(url: endpoint.url, response: BibInfo.self) { (response, error) in
                DispatchQueue.main.async { completion(response, error) }
            }
        }
        
        public static func search() {
            print("bibSearch")
        }
    }
}
