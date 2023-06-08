import Foundation

public struct PolarisAPI {
    
    /// Perform a network request and handle the response. (POST or PUT)
    /// - parameter endpoint: The endpoint defining the URL and other details for the request.
    /// - parameter requestBody: The request body to be sent with the network request.
    /// - parameter responseType: The type of the expected response conforming to `PolarisResponse` and `Decodable`.
    /// - parameter authorization: Indicate whether the API method requires an authentication header to be sent (POST only).
    /// - note: The `responseType` must conform to the `PolarisResponse` and `Decodable` protocols.
    /// - important: This signature should be used with POST or PUT requests that require a request body.
    
    internal static func performRequest<RequestType: Encodable, ResponseType: PolarisResponse & Decodable>(
        endpoint: PolarisEndpoint,
        requestBody: RequestType,
        responseType: ResponseType.Type,
        authorization isAuthorizationRequired: Bool = false
    ) async throws -> ResponseType {
        do {
            var response: ResponseType
            
            switch endpoint.httpMethod {
            case HTTPClient.HTTPMethod.post:
                response = try await HTTPClient.taskForPostRequest(
                    url: endpoint.url,
                    body: requestBody as RequestType,
                    response: responseType,
                    authorization: isAuthorizationRequired
                )
                
            case HTTPClient.HTTPMethod.put:
                response = try await HTTPClient.taskForPutRequest(
                    url: endpoint.url,
                    body: requestBody as RequestType,
                    response: responseType
                )
                
            default:
                throw PolarisError.generalError
            }
            
            guard
                response.error == nil
            else {
                throw response.error!
            }
            
            return response
            
        } catch {
            throw error
        }
    }
    
    /// Perform a network request and handle the response. (PUT)
    /// - parameter endpoint: The endpoint defining the URL and other details for the request.
    /// - parameter responseType: The type of the expected response conforming to `PolarisResponse` and `Decodable`.
    /// - note: The `responseType` must conform to the `PolarisResponse` and `Decodable` protocols.
    /// - important: This signature should be used with PUT requests without a request body.
    
    internal static func performRequest<ResponseType: PolarisResponse & Decodable>(
        endpoint: PolarisEndpoint,
        responseType: ResponseType.Type
    ) async throws -> ResponseType {
        do {
            var response: ResponseType
            
            switch endpoint.httpMethod {
            case HTTPClient.HTTPMethod.put:
                response = try await HTTPClient.taskForPutRequest(
                    url: endpoint.url,
                    response: responseType
                )
                
            default:
                throw PolarisError.generalError
            }
            
            guard
                response.error == nil
            else {
                throw response.error!
            }
            
            return response
            
        } catch {
            throw error
        }
    }
    
    /// Perform a network request and handle the response. (DELETE or GET)
    /// - parameter endpoint: The endpoint defining the URL and other details for the request.
    /// - parameter responseType: The type of the expected response conforming to `PolarisResponse` and `Decodable`.
    /// - parameter authorization: Indicate whether the API method requires an authentication header to be sent (GET only).
    /// - note: The `responseType` must conform to the `PolarisResponse` and `Decodable` protocols.
    /// - important: This signature should be used with DELETE or GET requests.
    
    internal static func performRequest<ResponseType: PolarisResponse & Decodable>(
        endpoint: PolarisEndpoint,
        responseType: ResponseType.Type,
        authorization isAuthorizationRequired: Bool
    ) async throws -> ResponseType {
        do {
            var response: ResponseType
            
            switch endpoint.httpMethod {
            case HTTPClient.HTTPMethod.delete:
                response = try await HTTPClient.taskForDeleteRequest(
                    url: endpoint.url,
                    response: responseType
                )
                
            case HTTPClient.HTTPMethod.get:
                response = try await HTTPClient.taskForGetRequest(
                    url: endpoint.url,
                    response: responseType,
                    authorization: isAuthorizationRequired
                )
                
            default:
                throw PolarisError.generalError
            }
            
            guard
                response.error == nil
            else {
                throw response.error!
            }
            
            return response
            
        } catch {
            throw error
        }
    }
    
    public struct Authenticate {}
    
    public struct Bib {}
    
    public struct HoldRequest {}
    
    public struct Item {}
    
    public struct Patron {}
    
    public struct RecordSet {}
    
    public struct System {}
}
