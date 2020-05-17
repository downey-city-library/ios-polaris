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
        internal static let put = "PUT"
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
     Perform an HTTP GET Request
     - parameter url: The url to be queried.
     - parameter response: The HTTP response.
     - parameter isAuthorizationRequired: A boolean flag indicating whether the API access secret should be used.
     - parameter completion: A callback containing the HTTP response and/or error.
     */
    internal class func taskForGETRequest<ResponseType: Decodable>(url: URL, response: ResponseType.Type, authorization isAuthorizationRequired: Bool = false, completion: @escaping (ResponseType?, Error?) -> Void) {
        // make sure that there is an authenticated staff user -- there is no point in proceeding otherwise
        guard let authenticatedStaffUser = Polaris.authenticatedStaffUser else {
            completion(nil, nil)
            return
        }
        
        // get date string in rfc1123 format
        let date = DateTime.rfc1123()
        
        // access secret
        let accessSecret = isAuthorizationRequired ? authenticatedStaffUser.access?.secret : ""
        
        // generate request signature
        let signature = getSignature(httpMethod: HTTPMethod.get, date: date, endpoint: url.absoluteString, secret: accessSecret!)
        
        // build url request
        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
        request.httpMethod = HTTPMethod.get
        
        // if authorization is required, add access token header
        if isAuthorizationRequired {
            request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
        }
        
        // perform url request
        task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
//            print("Data from GET Request", String(bytes: data, encoding: .utf8)!)
            
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
            
//            print("Data from POST Request", String(bytes: data, encoding: .utf8)!)
            
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
    
    internal class func taskForPUTRequest<ResponseType: Decodable>(url: URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        guard let authenticatedStaffUser = Polaris.authenticatedStaffUser else {
            completion(nil, nil)
            return
        }
        
        // get date string in rfc1123 format
        let date = DateTime.rfc1123()
        
        // access secret
        let accessSecret = authenticatedStaffUser.access!.secret
        
        // generate request signature
        let signature = getSignature(httpMethod: HTTPMethod.put, date: date, endpoint: url.absoluteString, secret: accessSecret)
        
        // build url request
        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
        request.httpMethod = HTTPMethod.put
        request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
        
        // perform url request
        task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            print("Data from PUT Request", String(bytes: data, encoding: .utf8)!)
            
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
    
    internal class func taskForPUTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, body: RequestType, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        guard let authenticatedStaffUser = Polaris.authenticatedStaffUser else {
            completion(nil, nil)
            return
        }
        
        // get date string in rfc1123 format
        let date = DateTime.rfc1123()
        
        // access secret
        let accessSecret = authenticatedStaffUser.access!.secret
        
        // generate request signature
        let signature = getSignature(httpMethod: HTTPMethod.put, date: date, endpoint: url.absoluteString, secret: accessSecret)
        
        // build url request
        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
        request.httpMethod = HTTPMethod.put
        request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
        
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
            
            print("Data from PUT Request", String(bytes: data, encoding: .utf8)!)
            
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
