import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum TitleList: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronTitleListAddTitle`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: POST
        
        case add(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronTitleListCopyTitle`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: POST
        
        case copy(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronTitleListCopyAllTitles`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: POST
        
        case copyAll(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronTitleListGetTitles`
        /// - parameter barcode: PatronBarcode
        /// - parameter list: list
        /// - parameter startPosition: StartPosition
        /// - parameter endPosition: EndPosition
        /// - note: HTTP Method: GET
        
        case get(
            barcode: String,
            list: Int,
            startPosition: Int?,
            endPosition: Int?
        )
        
        /// PAPI Method Name: `PatronTitleListMoveTitle`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: POST
        
        case move(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronTitleListDeleteTitle`
        /// - parameter barcode: PatronBarcode
        /// - parameter list: list_id
        /// - parameter position: position_id
        /// - note: HTTP Method: DELETE
        
        case delete(
            barcode: String,
            list: Int,
            position: Int
        )
        
        /// PAPI Method Name: `PatronTitleListDeleteAllTitles`
        /// - parameter barcode: PatronBarcode
        /// - parameter list: list
        /// - note: HTTP Method: DELETE
        
        case deleteAll(
            barcode: String,
            list: Int
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .add(
                let barcode
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistaddtitle"
                
            case .copy(
                let barcode
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistcopytitle"
                
            case .copyAll(
                let barcode
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistcopyalltitles"
                
            case .get(
                let barcode,
                let list,
                let startPosition,
                let endPosition
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistgettitles"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "list", value: "\(list)")
                ]
                if let startPosition {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "startPosition", value: "\(startPosition)")
                    )
                }
                if let endPosition {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "endPosition", value: "\(endPosition)")
                    )
                }
                
            case .move(
                let barcode
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistmovetitle"
                
            case .delete(
                let barcode,
                let list,
                let position
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistdeletetitle"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "list", value: "\(list)"),
                    URLQueryItem(name: "position", value: "\(position)")
                ]
                
            case .deleteAll(
                let barcode,
                let list
            ):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patrontitlelistdeletealltitles"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "list", value: "\(list)")
                ]
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .add(_):
                return HTTPClient.HTTPMethod.post
                
            case .copy(_):
                return HTTPClient.HTTPMethod.post
                
            case .copyAll(_):
                return HTTPClient.HTTPMethod.post
                
            case .get(_, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .move(_):
                return HTTPClient.HTTPMethod.post
                
            case .delete(_, _, _):
                return HTTPClient.HTTPMethod.delete
                
            case .deleteAll(_, _):
                return HTTPClient.HTTPMethod.delete
            }
        }
    }
}
