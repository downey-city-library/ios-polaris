import Foundation

extension HTTPClient.Endpoint {
    
    enum RecordSet: PolarisEndpoint {
    
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `RecordSetContentPut`
        /// - important: action = add
        /// - parameter id: RecordSetID
        /// - parameter user: user_id
        /// - parameter workstation: wsid
        /// - note: HTTP Method: PUT
        
        case add(
            id: Int,
            user: Int,
            workstation: Int
        )
        
        /// PAPI Method Name: `RecordSetRecordsGet`
        /// - parameter id:RecordSetID
        /// - parameter user: userid
        /// - parameter workstation: wsid
        /// - parameter startIndex: startIndex
        /// - parameter numberOfRecords: numRecords
        /// - note: HTTP Method: GET
        
        case get(
            id: Int,
            user: Int,
            workstation: Int,
            startIndex: Int,
            numberOfRecords: Int
        )
        
        /// - PAPI Method Name: `RecordSetContentPut`
        /// - important: action = remove
        /// - parameter id: RecordSetID
        /// - parameter user: user_id
        /// - parameter workstation: wsid
        /// - note: HTTP Method: PUT
        
        case remove(
            id: Int,
            user: Int,
            workstation: Int
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .add(
                let recordSetID,
                let userID,
                let workstationID
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/recordsets/\(recordSetID)"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "userid", value: "\(userID)"),
                    URLQueryItem(name: "wsid", value: "\(workstationID)"),
                    URLQueryItem(name: "action", value: "add")
                ]
                
            case .get(
                let recordSetID,
                let userID,
                let workstationID,
                let startIndex,
                let numRecords
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/recordsets/\(recordSetID)/records"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "userid", value: "\(userID)"),
                    URLQueryItem(name: "wsid", value: "\(workstationID)"),
                    URLQueryItem(name: "startIndex", value: "\(startIndex)"),
                    URLQueryItem(name: "numRecords", value: "\(numRecords)")
                ]
                
            case .remove(
                let recordSetID,
                let userID,
                let workstationID
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/recordsets/\(recordSetID)"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "userid", value: "\(userID)"),
                    URLQueryItem(name: "wsid", value: "\(workstationID)"),
                    URLQueryItem(name: "action", value: "remove")
                ]
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .add(_, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .get(_, _, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .remove(_, _, _):
                return HTTPClient.HTTPMethod.put
            }
        }
    }
}
