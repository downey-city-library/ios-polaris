import Foundation

extension HTTPClient.Endpoint {
    
    enum HoldRequest: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        
        /// PAPI Method Name: `HoldRequestSuspend`
        /// - parameter barcode: PatronBarcode
        /// - parameter id: RequestID
        /// - note: HTTP Method: PUT
        /// - important: This is the same endpoint used to suspend HoldRequests -- "active" is appended to the path to indicate that the request should activate a hold instead of suspend.
        
        case activate(
            barcode: String,
            id: Int
        )
        
        /// PAPI Method Name: `HoldRequestSuspend`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: PUT
        /// - important: This is the same endpoint used to suspend HoldRequests -- "active" is appended to the path to indicate that the request should activate a hold instead of suspend.
        
        case activateAll(
            barcode: String
        )
        
        /// PAPI Method Name: `HoldRequestCancel`
        /// - parameter barcode: PatronBarcode
        /// - parameter id: RequestID
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case cancel(
            barcode: String,
            id: Int,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `HoldRequestCancelAllForPatron`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case cancelAll(
            barcode: String,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `HoldRequestCreate`
        /// - note: HTTP Method: POST
        
        case create
        
        /// PAPI Method Name: `HoldRequestGetList`
        /// - parameter branch: branch
        /// - parameter branchType: branchtype
        /// - parameter status: requeststatus
        /// - parameter expirationDate: expirationdate
        /// - parameter useExpirationDate: useexpirationdate
        /// - note: HTTP Method: GET
        
        case getList(
            branch: Int,
            branchType: Int,
            status: Int
        )
        
        /// PAPI Method Name: `HoldRequestReply`
        /// - parameter guid: RequestGUID
        /// - note: HTTP Method: PUT
        
        case reply(
            guid: String
        )
        
        /// PAPI Method Name: `HoldRequestSuspend`
        /// - parameter barcode: PatronBarcode
        /// - parameter id: RequestID
        /// - note: HTTP Method: PUT
        /// - important: This is the same endpoint used to activate HoldRequests -- "inactive" is appended to the path to indicate that the request should suspend a hold instead of activate.
        
        case suspend(
            barcode: String,
            id: Int
        )
        
        /// PAPI Method Name: `HoldRequestSuspendAllForPatron`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: PUT
        /// - important: This is the same endpoint used to activate HoldRequests -- "inactive" is appended to the path to indicate that the request should suspend a hold instead of activate.
        
        case suspendAll(
            barcode: String
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .activate(
                let barcode,
                let id
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/\(id)/active"
                
            case .activateAll(
                let barcode
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/0/active"
                
            case .cancel(
                let barcode,
                let id,
                let workstation,
                let user
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/\(id)/cancelled"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .cancelAll(
                let barcode,
                let workstation,
                let user
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/0/cancelled"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .create:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/holdrequest"
                
            case .getList(
                let branch,
                let branchType,
                let status
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(Polaris.authenticatedStaffUser?.access?.token ?? "")/circulation/requests/list"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "branch", value: "\(branch)"),
                    URLQueryItem(name: "branchtype", value: "\(branchType)"),
                    URLQueryItem(name: "requeststatus", value: "\(status)")
                ]
                
            case .reply(
                let guid
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/holdrequest/\(guid)"
                
            case .suspend(
                let barcode,
                let id
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/\(id)/inactive"
                
            case .suspendAll(
                let barcode
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/0/inactive"
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .activate(_, _):
                return HTTPClient.HTTPMethod.put
                
            case .activateAll(_):
                return HTTPClient.HTTPMethod.put
                
            case .cancel(_, _, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .cancelAll(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .create:
                return HTTPClient.HTTPMethod.post
                
            case .getList(_, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .reply(_):
                return HTTPClient.HTTPMethod.put
                
            case .suspend(_, _):
                return HTTPClient.HTTPMethod.put
                
            case .suspendAll(_):
                return HTTPClient.HTTPMethod.put
            }
        }
    }
}

