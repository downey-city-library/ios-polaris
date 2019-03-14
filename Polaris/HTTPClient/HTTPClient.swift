//
//  HTTPClient.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal class HTTPClient {
    
    // MARK: - Private Properties
    fileprivate static let decoder = JSONDecoder()
    fileprivate static let encoder = JSONEncoder()
    fileprivate static var task: URLSessionDataTask!
    
    fileprivate struct HTTPMethod {
        internal static let get = "GET"
        internal static let post = "POST"
    }
    
    // MARK: - Base HTTP Request
    
    /**
     Generate the base URL Request used by all HTTP methods.
     
     - parameter url: The url being called.
     - parameter date: The current DateTime.
     - parameter signature: The hashed signature string, used for authentication.
     - returns: A URLRequest object.
     */
    fileprivate class func generateBaseHTTPRequest(url: URL, date: String, signature: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(date, forHTTPHeaderField: "PolarisDate")
        request.setValue("PWS \(PolarisConfiguration.shared.access.id):\(signature)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    // MARK: - HMAC-SHA1 Encryption
    
    /**
     Generate a hash signature using HMAC-SHA1 encyption.
     
     Using the parameter values, create a concatenated string and pass this string through a hashing algorithm.

     - parameter httpMethod: The HTTP method being used.
     - parameter date: The current DateTime.
     - parameter endpoint: The url being called.
     - parameter secret: The API access secret (required for protected API methods).
     - returns: A hashed string.
     */
    fileprivate class func getSignature(httpMethod: String, date: String, endpoint: String, secret: String = "") -> String {
        let combinedString = "\(httpMethod)\(endpoint)\(date)\(secret)"
        let hmac = combinedString.hmac(key: PolarisConfiguration.shared.access.key)
        return hmac
    }
    
    // MARK: - HTTP Requests
    
    /**
     Perform an HTTP POST Request
     - parameter url: The url to be queried.
     - parameter body: The request body.
     - parameter response: The HTTP response.
     - parameter completion: A callback containing the HTTP response and/or error.
     */
    internal class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, body: RequestType, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        // get date string in rfc1123 format
        let date = DateTime.rfc1123()
        
        // generate request signature
        let signature = getSignature(httpMethod: HTTPMethod.post, date: date, endpoint: url.absoluteString)
        
        // build url request
        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
        request.httpMethod = HTTPMethod.post
        
        // add http request body
        do {
            request.httpBody = try encoder.encode(body)
        } catch {
            completion(nil, error)
            return
        }
        
        // perform url request
        task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(responseObject, nil)
                return
            } catch {
                completion(nil, error)
                return
            }
        }
        
        task.resume()
    }
}
