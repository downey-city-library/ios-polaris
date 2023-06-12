import Foundation

extension HTTPClient.Endpoint {
    
    enum Patron: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronBasicDataGet`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case basicData(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronHoldRequestsGet`
        /// - parameter barcode: PatronBarcode
        /// - parameter endpoint: endpoint
        /// - note: HTTP Method: GET
        
        case holdRequests(
            barcode: String,
            endpoint: String
        )
        
        /// PAPI Method Name: `PatronILLRequestsGet`
        /// - parameter barcode: PatronBarcode
        /// - parameter endpoint: endpoint
        /// - note: HTTP Method: GET
        
        case ILLRequests(
            barcode: String,
            endpoint: String
        )
        
        /// PAPI Method Name: `PatronItemsOutGet`
        /// - parameter barcode: PatronBarcode
        /// - parameter endpoint: ID
        /// - note: HTTP Method: GET
        
        case items(
            barcode: String,
            endpoint: String
        )
        
        /// PAPI Method Name: `PatronPreferencesGet`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case preferences(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronSavedSearchesGet`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case savedSearches(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronSearch`
        /// - parameter query: q
        /// - parameter resultsPerPage: patronsperpage
        /// - parameter page: page
        /// - parameter sort: sort
        /// - note: HTTP Method: GET
        
        case search(
            query: String,
            resultsPerPage: Int,
            page: Int,
            sort: String?
        )
        
        /// PAPI Method Name: `PatronUpdateUserName`
        /// - parameter barcode: PatronBarcode
        /// - parameter username: NewUsername
        /// - note: HTTP Method: PUT
        
        case updateUsername(
            barcode: String,
            username: String
        )
        
        /// PAPI Method Name: `PatronValidate`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case validate(
            barcode: String
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .basicData(let barcode):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/basicdata"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "addresses", value: "1")
                ]
                
            case .holdRequests(let barcode, let endpoint):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/\(endpoint)"
                
            case .ILLRequests(let barcode, let endpoint):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/illrequests/\(endpoint)"
                
            case .items(let barcode, let endpoint):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/itemsout/\(endpoint)"
                
            case .preferences(let barcode):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/preferences"
                
            case .savedSearches(let barcode):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/savedsearches"
                
            case .search(let query, let resultsPerPage, let page, let sort):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/search/patrons/boolean"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "q", value: "\(query)"),
                    URLQueryItem(name: "patronsperpage", value: "\(resultsPerPage)"),
                    URLQueryItem(name: "page", value: "\(page)")
                ]
                if let sort {
                    urlComponents?.queryItems?.append(URLQueryItem(name: sort, value: sort))
                }
                
            case .updateUsername(let barcode, let username):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/username/\(username)"
                
            case .validate(let barcode):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)"
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            
            switch self {
            case .basicData(_):
                return HTTPClient.HTTPMethod.get
                
            case .holdRequests(_, _):
                return HTTPClient.HTTPMethod.get
                
            case .ILLRequests(_, _):
                return HTTPClient.HTTPMethod.get
                
            case .items(_, _):
                return HTTPClient.HTTPMethod.get
                
            case .preferences(_):
                return HTTPClient.HTTPMethod.get
                
            case .savedSearches(_):
                return HTTPClient.HTTPMethod.get
                
            case .search(_, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .updateUsername(_, _):
                return HTTPClient.HTTPMethod.put
                
            case .validate(_):
                return HTTPClient.HTTPMethod.get
            }
        }
    }
}
