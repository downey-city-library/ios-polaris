import Foundation

extension HTTPClient.Endpoint {
    
    enum System: PolarisEndpoint {
        
        // MARK: - ENDPOINTS
        /// PAPI Method Name: `SAMobilePhoneCarriersGetResult`
        /// - note: HTTP Method: GET
        
        case mobilePhoneCarriers
        
        /// PAPI Method Name: `CollectionsGet`
        /// - note: HTTP Method: GET
        
        case collections
        
        /// PAPI Method Name: `DatesClosedGet`
        /// - note: HTTP Method: GET
        
        case datesClosed
        
        /// PAPI Method Name: `LimitFiltersGet`
        /// - note: HTTP Method: GET
        
        case limitFilters
        
        /// PAPI Method Name: `MaterialTypesGet`
        /// - note: HTTP Method: GET
        
        case materialTypes
        
        /// PAPI Method Name: `OrganizationsGet`
        /// - parameter endpoint: endpoint
        /// - note: HTTP Method: GET
        
        case organizations(
            endpoint: String
        )
        
        /// PAPI Method Name: `PatronCodesGetResult`
        /// - note: HTTP Method: GET
        
        case patronCodes
        
        /// PAPI Method Name: `PickupBranchesGet`
        /// - note: HTTP Method: GET
        
        case pickupBranches
        
        /// PAPI Method Name: `RemoteStorageItemsGet`
        /// - parameter branch: branch
        /// - parameter startDate: startdate
        /// - parameter endDate: enddate
        /// - parameter maxItems: maxitems
        /// - parameter listType: listtype
        /// - parameter startPosition: startitemrecordid
        /// - note: HTTP Method: GET
        
        case remoteStorageItems(
            branch: Int,
            startDate: String,
            endDate: String,
            maxItems: Int,
            listType: Int,
            startPosition: Int?
        )
        
        /// PAPI Method Name: `HeadingsSearch`
        /// - parameter qualifier: Qualifiername
        /// - parameter startPoint: startpoint
        /// - parameter numnberOfResults: numterms
        /// - parameter position: preferredpos
        /// - parameter omitFromTransactionLog: notran
        /// - note: HTTP Method: GET
        
        case searchHeadings(
            qualifier: String,
            startingPoint: String?,
            numberOfResults: Int,
            position: Int,
            omitFromTransactionLog: Bool?
        )
        
        /// PAPI Method Name: `ShelfLocationsGet`
        /// - parameter organization: orgID
        /// - note: HTTP Method: GET
        
        case shelfLocations(
            organization: Int
        )
        
        /// PAPI Method Name: `SortOptionsGet`
        /// - note: HTTP Method: GET
        
        case sortOptions
        
        /// PAPI Method Name: `NotificationUpdate`
        /// - parameter type: NotificationTypeID
        /// - note: HTTP Method: PUT
        
        case updateNotification(
            type: Int
        )
        
        /// PAPI Method Name: `UpdatePickupBranchID`
        /// - parameter barcode: PatronBarcode
        /// - parameter id: RequestID
        /// - parameter workstation: wsid
        /// - parameter user: userid
        /// - parameter branch: pickupbranchid
        /// - note: HTTP Method: PUT
        
        case updatePickupBranchID(
            barcode: String,
            id: Int,
            workstation: Int,
            user: Int,
            branch: Int
        )
        
        /// PAPI Method Name: `RequestsUpdateStatus`
        /// - parameter id: RequestID
        /// - parameter action: action
        /// - parameter item: itemid
        /// - parameter deny: denyreason
        /// - note: HTTP Method: PUT
        
        case updateRequestStatus(
            id: Int,
            action: String,
            item: Int?,
            deny: Int?
        )
        
        // MARK: - URL STRING
        var string: String {
            var urlComponents: URLComponents?
            
            switch self {
            case .mobilePhoneCarriers:
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/sysadmin/mobilephonecarriers"
                
            case .collections:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/collections"
                
            case .datesClosed:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/datesclosed"
                
            case .limitFilters:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/limitfilters"
                
            case .materialTypes:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/materialtypes"
                
            case .organizations(
                let filter
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/organizations/\(filter)"
                
            case .patronCodes:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patroncodes"
                
            case .pickupBranches:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/pickupbranches"
                
            case .remoteStorageItems(
                let branch,
                let startDate,
                let endDate,
                let maxItems,
                let listType,
                let startPosition
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/cataloging/remotestorage/items"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "branch", value: "\(branch)"),
                    URLQueryItem(name: "startdate", value: startDate),
                    URLQueryItem(name: "enddate", value: endDate),
                    URLQueryItem(name: "maxitems", value: "\(maxItems)"),
                    URLQueryItem(name: "listtype", value: "\(listType)")
                ]
                if let startPosition {
                    urlComponents?.queryItems?.append(URLQueryItem(name: "startitemrecordid", value: "\(startPosition)"))
                }
                
            case .searchHeadings(
                let qualifier,
                let startingPoint,
                let numberOfResults,
                let position,
                let omitFromTransactionLog
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/search/headings/\(qualifier)"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "numterms", value: "\(numberOfResults)"),
                    URLQueryItem(name: "preferredpos", value: "\(position)")
                ]
                if let startingPoint {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "startpoint", value: startingPoint)
                    )
                }
                if let omitFromTransactionLog, omitFromTransactionLog {
                    urlComponents?.queryItems?.append(
                        URLQueryItem(name: "notran", value: "1")
                    )
                }
                
            case .shelfLocations(
                let organization
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/shelflocations"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "orgID", value: "\(organization)")
                ]
                
            case .sortOptions:
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/sortoptions"
                
            case .updateNotification(
                let type
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/notification/\(type)"
                
            case .updatePickupBranchID(
                let barcode,
                let id,
                let user,
                let workstation,
                let branch
            ):
                urlComponents = URLComponents(string: basePublic)
                urlComponents?.path += "/patron/\(barcode)/holdrequests/\(id)/pickupbranch"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "userid", value: "\(user)"),
                    URLQueryItem(name: "wsid", value: "\(workstation)"),
                    URLQueryItem(name: "pickupbranchid", value: "\(branch)")
                ]
                
            case .updateRequestStatus(
                let id,
                let action,
                let item,
                let deny
            ):
                urlComponents = URLComponents(string: baseProtected)
                urlComponents?.path += "/\(accessToken)/circulation/requests/\(id)/status"
                urlComponents?.queryItems = [
                    URLQueryItem(name: "action", value: action)
                ]
                if let item {
                    urlComponents?.queryItems?.append(URLQueryItem(name: "itemid", value: "\(item)"))
                }
                if let deny {
                    urlComponents?.queryItems?.append(URLQueryItem(name: "denyreason", value: "\(deny)"))
                }
            }
            
            return urlComponents?.url?.absoluteString ?? ""
        }
        
        // MARK: - HTTP METHOD
        var httpMethod: String {
            switch self {
            case .mobilePhoneCarriers:
                return HTTPClient.HTTPMethod.get
                
            case .collections:
                return HTTPClient.HTTPMethod.get
                
            case .datesClosed:
                return HTTPClient.HTTPMethod.get
                
            case .limitFilters:
                return HTTPClient.HTTPMethod.get
                
            case .materialTypes:
                return HTTPClient.HTTPMethod.get
                
            case .organizations(_):
                return HTTPClient.HTTPMethod.get
                
            case .patronCodes:
                return HTTPClient.HTTPMethod.get
                
            case .pickupBranches:
                return HTTPClient.HTTPMethod.get
                
            case .remoteStorageItems(_, _, _, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .searchHeadings(_, _, _, _, _):
                return HTTPClient.HTTPMethod.get
                
            case .shelfLocations(_):
                return HTTPClient.HTTPMethod.get
                
            case .sortOptions:
                return HTTPClient.HTTPMethod.get
                
            case .updateNotification(_):
                return HTTPClient.HTTPMethod.put
                
            case .updatePickupBranchID(_, _, _, _, _):
                return HTTPClient.HTTPMethod.put
                
            case .updateRequestStatus(_, _, _, _):
                return HTTPClient.HTTPMethod.put
            }
        }
    }
}
