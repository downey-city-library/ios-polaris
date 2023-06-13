import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Message: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronMessagesGet`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case get(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronMessageUpdateStatus`
        /// - parameter barcode: PatronBarcode
        /// - parameter type: MessageType
        /// - parameter id: MessageID
        /// - note: HTTP Method: PUT
        
        case updateStatus(
            barcode: String,
            type: String,
            id: Int
        )
        
        /// PAPI Method Name: `PatronMessageDelete`
        /// - parameter barcode: PatronBarcode
        /// - parameter type: MessageType
        /// - parameter id: MessageID
        /// - note: HTTP Method: PUT
        
        case delete(
            barcode: String,
            type: String,
            id: Int
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .get(let barcode):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/messages"
                
            case .updateStatus(let barcode, let messageType, let messageID):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/messages/\(messageType)/\(messageID)"
                
            case .delete(let barcode, let messageType, let messageID):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/messages/\(messageType)/\(messageID)"
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .get(_):
                return HTTPClient.HTTPMethod.get
                
            case .updateStatus(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .delete(_, _, _):
                return HTTPClient.HTTPMethod.delete
            }
        }
    }
}
