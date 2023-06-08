import Foundation

extension HTTPClient.Endpoint {
    
    enum Bib: PolarisEndpoint {
        
        // MARK: - TYPEALIASES
        typealias Qualifier = Polaris.Qualifier
        typealias SortBy = Polaris.SortBy
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `BibBooleanSearch`
        /// - parameter query: q
        /// - parameter sortby: sortby
        /// - parameter resultsPerPage: bibsperpage
        /// - parameter page: page
        /// - parameter limit: limit
        /// - parameter omitFromTransactionLog: notran
        /// - note: HTTP Method: GET
        
        case booleanSearch(
            query: String,
            sortby: SortBy?,
            resultsPerPage: Int?,
            page: Int?,
            limit: String?,
            omitFromTransactionLog: Bool?
        )
        
        /// PAPI Method Name: `BibGet`
        /// - parameter id: BibID
        /// - note: HTTP Method: GET
        
        case get(
            id: Int
        )
        
        /// PAPI Method Name: `BibHoldingsGet`
        /// - parameter id: BibID
        /// - note: HTTP Method: GET 
        
        case holdings(
            id: Int
        )
        
        /// PAPI Method Name: `BibKeywordSearch`
        /// - parameter qualifier: qualifierName
        /// - parameter query: q
        /// - parameter sortby: sortby
        /// - parameter resultsPerPage: bibsperpage
        /// - parameter page: page
        /// - parameter limit: limit
        /// - parameter omitFromTransactionLog: notran
        /// - note: HTTP Method: GET
        
        case keywordSearch(
            qualifier: Qualifier,
            query: String,
            sortby: SortBy?,
            resultsPerPage: Int?,
            page: Int?,
            limit: String?,
            omitFromTransactionLog: Bool?
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .booleanSearch(
                let query,
                let sortby,
                let resultsPerPage,
                let page,
                let limit,
                let omitFromTransactionLog
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/search/bibs/Boolean"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "q", value: query)
                ]
                if let sortby {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "sortby", value: sortby.string)
                    )
                }
                if let resultsPerPage {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "bibsperpage", value: "\(resultsPerPage)")
                    )
                }
                if let page {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "page", value: "\(page)")
                    )
                }
                if let limit {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "limit", value: limit)
                    )
                }
                if let omitFromTransactionLog, omitFromTransactionLog {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "notran", value: "1")
                    )
                }
                
            case .get(
                let bibID
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/bib/\(bibID)"
                
            case .holdings(
                let bibID
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/bib/\(bibID)/holdings"
                
            case .keywordSearch(
                let qualifier,
                let query,
                let sortby,
                let resultsPerPage,
                let page,
                let limit,
                let omitFromTransactionLog
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/search/bibs/keyword/\(qualifier.string)"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "q", value: query),
                ]
                if let sortby {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "sortby", value: sortby.string)
                    )
                }
                if let resultsPerPage {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "bibsperpage", value: "\(resultsPerPage)")
                    )
                }
                if let page {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "page", value: "\(page)")
                    )
                }
                if let limit {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "limit", value: "\(limit)")
                    )
                }
                if let omitFromTransactionLog, omitFromTransactionLog {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "notran", value: "1")
                    )
                }
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .booleanSearch(_, _, _, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .get(_):
                return HTTPClient.HTTPMethod.get
                
            case .holdings(_):
                return HTTPClient.HTTPMethod.get
                
            case .keywordSearch(_, _, _, _, _, _, _):
                return HTTPClient.HTTPMethod.get
            }
        }
    }
}
