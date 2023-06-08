import Foundation

internal class HTTPClient {
    
    // MARK: - PROPERTIES
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    private static var task: URLSessionDataTask!
}

// MARK: - MTTP METHOD STRUCT
internal extension HTTPClient {
    
    struct HTTPMethod {
        internal static let delete = "DELETE"
        internal static let get = "GET"
        internal static let post = "POST"
        internal static let put = "PUT"
    }
}

// MARK: - BASE HTTP REQUEST
private extension HTTPClient {
    
    /// Generate the base URL Request used by all HTTP methods.
    /// - parameter url: The url being called.
    /// - parameter date: The current DateTime.
    /// - parameter signature: The hashed signature string, used for authentication.
    /// - returns: A URLRequest object.
   
    class func generateBaseHTTPRequest(url: URL, date: String, signature: String) -> URLRequest {
       var request = URLRequest(url: url)
       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       request.setValue("application/json", forHTTPHeaderField: "Accept")
       request.setValue(date, forHTTPHeaderField: "PolarisDate")
       request.setValue("PWS \(PolarisConfiguration.shared.access.id):\(signature)", forHTTPHeaderField: "Authorization")
       
       return request
   }
}

// MARK: - HMAC-SHA1 ENCRYPTION
private extension HTTPClient {
    
     /// Generate a hash signature using HMAC-SHA1 encyption.
     /// Using the parameter values, create a concatenated string and pass this string through a hashing algorithm.
     /// - parameter httpMethod: The HTTP method being used.
     /// - parameter date: The current DateTime.
     /// - parameter endpoint: The url being called.
     /// - parameter secret: The API access secret (required for protected API methods).
     /// - returns: A hashed string.
    
    class func getSignature(httpMethod: String, date: String, endpoint: String, secret: String = "") -> String {
        let combinedString = "\(httpMethod)\(endpoint)\(date)\(secret)"
        let hmac = combinedString.hmac(key: PolarisConfiguration.shared.access.key)
        return hmac
    }
}

// MARK: - HTTP REQUEST
private extension HTTPClient {
    
    class func performRequest<ResponseType: Decodable>(
        url: URL,
        httpMethod: String,
        body: Data? = nil,
        response: ResponseType.Type,
        isAuthorizationRequired: Bool = false
    ) async throws -> ResponseType {

        let date = DateTime.rfc1123()
        var secret = ""
        
        if isAuthorizationRequired {
            guard
                let authenticatedStaffUser = Polaris.authenticatedStaffUser,
                let access = authenticatedStaffUser.access
            else {
                throw PolarisError.polarisUserNotPermitted
            }
            
            secret = isAuthorizationRequired ? access.secret : ""
            print("secret generated:", secret)
        }
        
        let signature = getSignature(httpMethod: httpMethod, date: date, endpoint: url.absoluteString, secret: secret)

        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
        request.httpMethod = httpMethod

        if isAuthorizationRequired {
            guard
                let authenticatedStaffUser = Polaris.authenticatedStaffUser
            else {
                throw PolarisError.polarisUserNotPermitted
            }
            
            request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
            print("added header to request")
        }

        if let body {
            request.httpBody = body
            print("added body to request")
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let json = String(data: data, encoding: .utf8) {
            print("\n\nJSON: ", json)
        } else {
            print("Invalid JSON Data.")
        }
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print(response)
            throw PolarisError.generalError
        }
        
        let responseObject = try decoder.decode(ResponseType.self, from: data)
        print("\n\nresponseObject:", responseObject)

        return responseObject
    }
}

// MARK: - HTTP METHODS
internal extension HTTPClient {
    
     /// Perform an HTTP GET Request.
     /// - parameter url: The url to be queried.
     /// - parameter response: The HTTP response.
     /// - parameter isAuthorizationRequired: A boolean flag indicating whether the API access secret should be used.
    
    class func taskForGetRequest<ResponseType: Decodable>(
            url: URL,
            response: ResponseType.Type,
            authorization isAuthorizationRequired: Bool = false
        ) async throws -> ResponseType {
            print("taskForGetRequest<ResponseType: Decodable>")
            return try await performRequest(
                url: url,
                httpMethod: HTTPMethod.get,
                response: response,
                isAuthorizationRequired: isAuthorizationRequired
            )
        }
    
     /// Perform an HTTP POST Request.
     /// - parameter url: The url to be queried.
     /// - parameter body: The request body.
     /// - parameter response: The HTTP response.
    
    class func taskForPostRequest<RequestType: Encodable, ResponseType: Decodable>(
        url: URL,
        body: RequestType,
        response: ResponseType.Type,
        authorization isAuthorizationRequired: Bool = false
    ) async throws -> ResponseType {
        print("taskForPostRequest<RequestType: Encodable, ResponseType: Decodable>")
        let data = try encoder.encode(body)
        
        return try await performRequest(
            url: url,
            httpMethod: HTTPMethod.post,
            body: data,
            response: response,
            isAuthorizationRequired: isAuthorizationRequired
        )
    }
    
    ///  Perform an HTTP PUT Request.
    ///  - parameter url: The url to be queried.
    ///  - parameter response: The HTTP response.
    
    class func taskForPutRequest<ResponseType: Decodable>(
        url: URL,
        response: ResponseType.Type
    ) async throws -> ResponseType {
        print("taskForPutRequest<ResponseType: Decodable>")
        return try await performRequest(
            url: url,
            httpMethod: HTTPMethod.put,
            response: response,
            isAuthorizationRequired: true
        )
    }
    
    ///  Perform an HTTP PUT Request.
    ///  - parameter url: The url to be queried.
    ///  - parameter body: The request body.
    ///  - parameter response: The HTTP response.
    
    class func taskForPutRequest<RequestType: Encodable, ResponseType: Decodable>(
        url: URL,
        body: RequestType,
        response: ResponseType.Type
    ) async throws -> ResponseType {
        print("taskForPutRequest<RequestType: Encodable, ResponseType: Decodable>")

        let data = try encoder.encode(body)

        return try await performRequest(
            url: url,
            httpMethod: HTTPMethod.put,
            body: data,
            response: response,
            isAuthorizationRequired: true
        )
    }
    
    ///  Perform an HTTP DELETE Request.
    ///  - parameter url: The url to be queried.
    ///  - parameter response: The HTTP response.
        
    class func taskForDeleteRequest<ResponseType: Decodable>(
        url: URL,
        response: ResponseType.Type
    ) async throws -> ResponseType {
        try await performRequest(
            url: url,
            httpMethod: HTTPMethod.delete,
            response: response,
            isAuthorizationRequired: true
        )
    }
}

// MARK: - HTTP METHODS - PRE-REFACTORING - DO NOT DELETE UNTIL YOU HAVE THOROUGHLY TESTED ALL REQUEST TYPES
extension HTTPClient {
    
    //    class func taskForGETRequest<ResponseType: Decodable>(
    //        url: URL,
    //        response: ResponseType.Type,
    //        authorization isAuthorizationRequired: Bool = false
    //    ) async throws -> ResponseType {
    //        guard
    //            let authenticatedStaffUser = Polaris.authenticatedStaffUser
    //        else {
    //            throw PolarisError.polarisUserNotPermitted
    //        }
    //
    //        let date = DateTime.rfc1123()
    //        let secret = isAuthorizationRequired ? authenticatedStaffUser.access?.secret : ""
    //        let signature = getSignature(httpMethod: HTTPMethod.get, date: date, endpoint: url.absoluteString, secret: secret!)
    //
    //        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
    //        request.httpMethod = HTTPMethod.get
    //
    //        if isAuthorizationRequired {
    //            request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
    //        }
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        if let json = String(data: data, encoding: .utf8) {
    //            print(json)
    //        } else {
    //            print("Invalid JSON data")
    //        }
    //
    //        guard
    //            (response as? HTTPURLResponse)?.statusCode == 200
    //        else {
    //            throw PolarisError.generalError
    //        }
    //
    //        let responseObject = try decoder.decode(ResponseType.self, from: data)
    //
    //        return responseObject
    //    }
    
    //    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(
    //        url: URL,
    //        body: RequestType,
    //        response: ResponseType.Type
    //    ) async throws -> ResponseType {
    //
    //        let date = DateTime.rfc1123()
    //        let signature = getSignature(httpMethod: HTTPMethod.post, date: date, endpoint: url.absoluteString)
    //
    //        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
    //        request.httpMethod = HTTPMethod.post
    //
    //        // add http request body
    //        do {
    //            request.httpBody = try encoder.encode(body)
    //        } catch {
    //            throw error
    //        }
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        guard
    //            (response as? HTTPURLResponse)?.statusCode == 200
    //        else {
    //            throw PolarisError.generalError
    //        }
    //
    //        let responseObject = try decoder.decode(ResponseType.self, from: data)
    //
    //        return responseObject
    //    }
    
    //    class func taskForPUTRequest<ResponseType: Decodable>(
    //        url: URL,
    //        response: ResponseType.Type
    //    ) async throws -> ResponseType {
    //        guard
    //            let authenticatedStaffUser = Polaris.authenticatedStaffUser
    //        else {
    //            throw PolarisError.polarisUserNotPermitted
    //        }
    //
    //        let date = DateTime.rfc1123()
    //        let secret = authenticatedStaffUser.access!.secret
    //        let signature = getSignature(httpMethod: HTTPMethod.put, date: date, endpoint: url.absoluteString, secret: secret)
    //
    //        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
    //        request.httpMethod = HTTPMethod.put
    //        request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        guard
    //            (response as? HTTPURLResponse)?.statusCode == 200
    //        else {
    //            throw PolarisError.generalError
    //        }
    //
    //        let responseObject = try decoder.decode(ResponseType.self, from: data)
    //
    //        return responseObject
    //    }
    
    //    class func taskForPUTRequest<RequestType: Encodable, ResponseType: Decodable>(
    //        url: URL,
    //        body: RequestType,
    //        response: ResponseType.Type
    //    ) async throws -> ResponseType {
    //        guard
    //            let authenticatedStaffUser = Polaris.authenticatedStaffUser
    //        else {
    //            throw PolarisError.polarisUserNotPermitted
    //        }
    //
    //        let date = DateTime.rfc1123()
    //        let secret = authenticatedStaffUser.access!.secret
    //        let signature = getSignature(httpMethod: HTTPMethod.put, date: date, endpoint: url.absoluteString, secret: secret)
    //
    //        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
    //        request.httpMethod = HTTPMethod.put
    //        request.addValue(authenticatedStaffUser.access!.token, forHTTPHeaderField: "X-PAPI-AccessToken")
    //
    //        // add http request body
    //        do {
    //            request.httpBody = try encoder.encode(body)
    //        } catch {
    //            throw error
    //        }
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        if let json = String(data: data, encoding: .utf8) {
    //            print("taskForPUTRequest", json)
    //        } else {
    //            print("Invalid JSON data")
    //        }
    //
    //        guard
    //            (response as? HTTPURLResponse)?.statusCode == 200
    //        else {
    //            throw PolarisError.generalError
    //        }
    //
    //        let responseObject = try decoder.decode(ResponseType.self, from: data)
    //
    //        return responseObject
    //    }
    
    //    class func taskForDeleteRequest<ResponseType: Decodable>(
    //        url: URL,
    //        response: ResponseType.Type
    //    ) async throws -> ResponseType {
    //        let date = DateTime.rfc1123()
    //        let signature = getSignature(httpMethod: HTTPMethod.delete, date: date, endpoint: url.absoluteString)
    //
    //        var request = generateBaseHTTPRequest(url: url, date: date, signature: signature)
    //        request.httpMethod = HTTPMethod.delete
    //
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        if let json = String(data: data, encoding: .utf8) {
    //            print(json)
    //        } else {
    //            print("Invalid JSON data")
    //        }
    //
    //        guard
    //            (response as? HTTPURLResponse)?.statusCode == 200
    //        else {
    //            throw PolarisError.generalError
    //        }
    //
    //        let responseObject = try decoder.decode(ResponseType.self, from: data)
    //
    //        return responseObject
    //    }
}
