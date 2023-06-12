import Foundation

extension HTTPClient.Endpoint.Patron {
    
    enum Account: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `PatronAccountGet`
        /// - parameter barcode: PatronBarcode
        /// - parameter endpoint: endpoint
        /// - note: HTTP Method: GET
        
        case get(
            barcode: String,
            endpoint: String
        )
        
        /// PAPI Method Name: `PatronAccountPay`
        /// - parameter barcode: PatronBarcode
        /// - parameter transaction: ChargeTransactionID
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case pay(
            barcode: String,
            transaction: Int,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountPayAll`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case payAll(
            barcode: String,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountVoid`
        /// - parameter barcode: PatronBarcode
        /// - parameter transaction: VoidPaymentTransactionID
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: DELETE
        
        case void(
            barcode: String,
            transaction: Int,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountCreateCredit`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case createCredit(
            barcode: String,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountDepositCredit`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case depositCredit(
            barcode: String,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountRefundCredit`
        /// - parameter barcode: PatronBarcode
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - note: HTTP Method: PUT
        
        case refundCredit(
            barcode: String,
            workstation: Int,
            user: Int
        )
        
        /// PAPI Method Name: `PatronAccountCreateTitleList`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: POST
        
        case createTitleList(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronAccountGetTitleLists`
        /// - parameter barcode: PatronBarcode
        /// - note: HTTP Method: GET
        
        case getTitleLists(
            barcode: String
        )
        
        /// PAPI Method Name: `PatronAccountDeleteTitleList`
        /// - parameter barcode: PatronBarcode
        /// - parameter list: list
        /// - note: HTTP Method: DELETE
        
        case deleteTitleList(
            barcode: String,
            list: Int
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .get(let barcode, let endpoint):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/account/\(endpoint)"
                
            case .pay(let barcode, let transaction, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/\(transaction)/pay"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .payAll(let barcode, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/lumpsumpayment"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .void(let barcode, let transaction, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/\(transaction)/void/payment"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .createCredit(let barcode, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/createcredit"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .depositCredit(let barcode, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/lumpsumdepositcredit"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .refundCredit(let barcode, let workstation, let user):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.baseProtected)
                urlComponents?.path += "/\(accessToken)/patron/\(barcode)/account/lumpsumrefundcredit"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "userid", value: "\(user)")
                ]
                
            case .createTitleList(let barcode):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patronaccountcreatetitlelist"
                
            case .getTitleLists(let barcode):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patronaccountgettitlelists"
                
            case .deleteTitleList(let barcode, let list):
                urlComponents = URLComponents(string: HTTPClient.Endpoint.basePublic)
                urlComponents?.path += "/patron/\(barcode)/patronaccountdeletetitlelist"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "list", value: "\(list)")
                ]
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .get(_, _):
                return HTTPClient.HTTPMethod.get
                
            case .pay(_, _, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .payAll(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .void(_, _, _, _):
                return HTTPClient.HTTPMethod.delete
                
            case .createCredit(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .depositCredit(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .refundCredit(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .createTitleList(_):
                return HTTPClient.HTTPMethod.post
                
            case .getTitleLists(_):
                return HTTPClient.HTTPMethod.get
                
            case .deleteTitleList(_, _):
                return HTTPClient.HTTPMethod.delete
            }
        }
    }
}
