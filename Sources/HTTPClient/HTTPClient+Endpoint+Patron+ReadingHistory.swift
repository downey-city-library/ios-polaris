import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum ReadingHistory: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronReadingHistoryGet`
        /// - parameter barcode: PatronBarcode
        /// - parameter page: page
        /// - parameter resultsPerPage: rowsperpage
        /// - note: HTTP Method: GET
        
        case get(
            barcode: String,
            page: Int,
            resultsPerPage: Int
        )
        
        /// PAPI Method Name: `PatronReadingHistoryClear`
        /// - parameter barcode: PatronBarcode
        /// - parameter list: ids
        /// - note: HTTP Method: DELETE
        
        case clear(
            barcode: String,
            list: [Int]?
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .get(
                let barcode,
                let page,
                let resultsPerPage
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/readinghistory"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "page", value: "\(page)"),
                    URLQueryItem(name: "rowsperpage", value: "\(resultsPerPage)")
                ]
                
            case .clear(
                let barcode,
                let list
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/readinghistory"
                
                if let list {
                    urlComponents?.queryItems = [
                        URLQueryItem(name: "ids", value: "\(list.commaDelimitedString)")
                    ]
                }
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .get(_, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .clear(_, _):
                return HTTPClient.HTTPMethod.delete
            }
        }
    }
}
