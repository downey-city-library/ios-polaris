import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Registration: PolarisEndpoint {
    
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronRegistrationCreate`
        /// - note: HTTP Method: POST
        
        case create
        
        /// PAPI Method Name: `PatronRegistrationUpdate`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: PUT
        
        case update(
            barcode: String
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .create:
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron"
                
            case .update(
                let barcode
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)"
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .create:
                return HTTPClient.HTTPMethod.post
                
            case .update(_):
                return HTTPClient.HTTPMethod.put
            }
        }
    }
}
