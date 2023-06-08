import Foundation

extension HTTPClient.Endpoint {
    
    enum Authenticate: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `AuthenticatePatron`
        /// - note: HTTP Method: POST
        case patron
        
        /// PAPI Method Name: `AuthenticateStaffUser`
        /// - note: HTTP Method: POST
        case staffUser
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .patron:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/authenticator/patron"
                
            case .staffUser:
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/authenticator/staff"
            }
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .patron:
                return HTTPClient.HTTPMethod.post
                
            case .staffUser:
                return HTTPClient.HTTPMethod.post
            }
        }
    }
}
