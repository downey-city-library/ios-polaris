import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Blocks: PolarisEndpoint {
    
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronCirculateBlocksGet`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case circulation(
            barcode: String
        )
        
        /// PAPI Method Name: `CreatePatronBlocks`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstaton: wsid
        /// - note: HTTP Method: POST
        
        case create(
            barcode: String,
            workstation: Int
        )
        
        /// PAPI Method Name: `PatronRenewBlocksGet`
        /// - parameter id: PatronID
        /// - note: HTTP Method: GET
        
        case renew(
            id: Int
        )
  
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .circulation(let barcode):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/circulationblocks"
                
            case .create(let barcode, let workstationID):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/blocks"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstationID)")
                ]
                
            case .renew(let patronID):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/circulation/patron/\(patronID)/renewblocks"
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .circulation(_):
                return HTTPClient.HTTPMethod.get
                
            case .create(_, _):
                return HTTPClient.HTTPMethod.post
                
            case .renew(_):
                return HTTPClient.HTTPMethod.get
            }
        }
    }
}
