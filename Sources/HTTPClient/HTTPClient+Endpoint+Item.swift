import Foundation

extension HTTPClient.Endpoint {
    
    enum Item: PolarisEndpoint {
    
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `ItemRenew`
        /// - parameter barcode: PatronBarcode
        /// - parameter id: ID
        /// - note: HTTP Method: PUT
        
        case renew(
            barcode: String,
            id: Int
        )
        
        /// PAPI Method Name: `ItemRenewAllForPatron`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: PUT
        
        case renewAll(
            barcode: String
        )
        
        /// PAPI Method Name: `ItemUpdateBarcode`
        /// - parameter barcode: BarcodeOrID
        /// - parameter id: BarcodeOrID
        /// - parameter workstation: wsid
        /// - note: HTTP Method: PUT 
        
        case updateBarcode(
            barcode: String?,
            id: Int?,
            workstation: Int
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .renew(let barcode, let id):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/itemsout/\(id)"
                
            case .renewAll(let barcode):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/itemsout/0"
                
            case .updateBarcode(let barcode, let id, let workstation):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/cataloging/items/\(barcode ?? "\(id ?? -1)")/barcode"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)")
                ]
                if barcode != nil {
                    urlComponents?.queryItems?.append(URLQueryItem(name: "isBarcode", value: "1"))
                }
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .renew(_, _):
                return HTTPClient.HTTPMethod.put
                
            case .renewAll(_):
                return HTTPClient.HTTPMethod.put
                
            case .updateBarcode(_, _, _):
                return HTTPClient.HTTPMethod.put
            }
        }
    }
}
