import Foundation

extension PolarisAPI.System {
    
    // FIXME: - HeadingsSearch
    // Returns an access error. Is this disabled somehow?
    
    /// Searches an ordered list of terms and returns headings information relative to a given start point.
    /// - note: PAPI method name: `HeadingsSearch`
    /// - parameter qualifier: Qualifier name.
    /// - parameter startingPoint: The start point. If there is no matching entry, the first entry with a higher value will be the starting point. Also, if the start point begins with a common leading article (e.g. 'A', 'And' or 'The') and a right- truncated search does not match any entries, then the leading article will be stripped from the start point.
    /// - parameter numberOfTerms: The number of terms requested.
    /// - parameter preferredPosition: The preferred position of the start point within the returned entries. If (nPreferredPositionInResponse = 1) then the first row in the returned rowset corresponds to the start point. If (nPreferredPositionInResponse < 1) then the first row in the returned rowset corresponds to the entry N rows beyond the entry corresponding to the start point where N = (ABS
    
    public static func searchHeadings(
        qualifier: String,
        startingPoint: String?,
        numberOfResults: Int,
        position: Int,
        omitFromTransactionLog: Bool?
    ) async throws -> [Polaris.System.HeadingsSearchResponse.Heading] {
        let endpoint = HTTPClient.Endpoint.System.searchHeadings(
            qualifier: qualifier,
            startingPoint: startingPoint,
            numberOfResults: numberOfResults,
            position: position,
            omitFromTransactionLog: omitFromTransactionLog
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.HeadingsSearchResponse.self,
            authorization: true
        ).headings
    }
    
    // MARK: - CollectionsGet
    
    /// Returns a list of collections based on the organization ID. Branches utilize a subset of collection information maintained at the system level in Polaris. To retrieve a list of all collections in the system, pass in an organization ID of 1. To retrieve a list of collections for a specific branch, pass in the branch ID.
    /// - note: PAPI method name: `CollectionsGet`
    
    public static func collections() async throws -> [Polaris.System.CollectionsGetResponse.Collection] {
        let endpoint = HTTPClient.Endpoint.System.collections
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.CollectionsGetResponse.self,
            authorization: true
        ).collections
    }
    
    // MARK: - DatesClosedGet
    
    /// This method returns a list of dates closed by organization. If the specified organization ID does not exist, an error is returned (Invalid OrgID supplied, -5000).
    /// - note: PAPI method name: `DatesClosed`
    
    public static func datesClosed() async throws -> [Polaris.System.DatesClosedGetResponse.DateClosed] {
        let endpoint = HTTPClient.Endpoint.System.datesClosed
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.DatesClosedGetResponse.self,
            authorization: true
        ).datesClosed
    }
    
    // MARK: - LimitFiltersGet
    
    /// Returns list of valid bib search limit filters based on the organization’s Polaris System Administration values.
    /// - note: PAPI method name: `LimitFiltersGet`
    
    public static func limitFilters() async throws -> [Polaris.System.LimitFiltersGetResponse.LimitFilter] {
        let endpoint = HTTPClient.Endpoint.System.limitFilters
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.LimitFiltersGetResponse.self,
            authorization: true
        ).limitFilters
    }
    
    // TODO: - TODO: NotificationUpdate
    
    /// The NotificationUpdate method will update the Notification Log and remove or update the Notification Queue entry. It is also responsible for updating related ItemCheckout data elements and rolling phone notification into print notification. This method should be called after a patron is contacted.
    /// - note: PAPI method name: `NotificationUpdate`
    /// - parameter type: The unique identifier of the notification type.
    /// - parameter organization: Required for email notification. Not required for telephony notification. System ID is automatically used for telephony due to its centralized processing.
    /// - parameter status: Notification status ID.
    /// - parameter deliveryDate: Notification delivery date.
    /// - parameter deliveryString: Phone number or email.
    /// - parameter details: Status message from notification device. Manual bills require ItemBarcode in the Details tag. Cancellation notices require RequestID in the Details tag.
    /// - parameter patron: ID of patron being notified.
    /// - parameter language: Language ID used to contact patron. If not supplied, the default will be the patron’s preferred language.
    /// - parameter itemRecord: ID of item record attached to notification. Required for overdue, hold, and cancel phone notifications. ItemRecordID or ItemBarcode required for hold notices, almost overdue reminders, missing part notices, and bills.
    /// - parameter barcode: Barcode of the patron being notified.
    /// - parameter itemBarcode: Barcode of the item patron is being notified about.

    public static func updateNotification(
        type: Int,
        organization: Int?,
        status: Int,
        deliveryDate: Date,
        deliveryOption: Int,
        deliveryString: String,
        details: String?,
        patron: Int,
        language: Int?,
        itemRecord: Int,
        barcode: String,
        itemBarcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.System.updateNotification(
            type: type
        )
        let request = Polaris.System.NotificationUpdateRequest(
            logonBranchID: Polaris.authenticatedStaffUser?.branch ?? -1,
            logonUserID: Polaris.authenticatedStaffUser?.id ?? -1,
            logonWorkstationID: Polaris.authenticatedStaffUser?.workstation ?? -1,
            organization: organization,
            notificationStatusID: status,
            notificationDeliveryDate: deliveryDate,
            deliveryOptionID: deliveryOption,
            deliveryString: deliveryString,
            details: details,
            patronID: patron,
            language: language,
            itemRecordID: itemRecord
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.System.NotificationUpdateResponse.self
        ).error == nil
    }
    
    // MARK: - OrganizationsGet
    
    /// Returns list of system, library and branch level organizations. The list can be filtered by system, library, or branch.
    /// - note: PAPI method name: `OrganizationsGet`
    /// - parameter filter: Determines how the list is filtered: system, library, branch, or all.
    
    public static func organizations(
        filter: String
    ) async throws -> [Polaris.System.OrganizationsGetResponse.Organization] {
        let endpoint = HTTPClient.Endpoint.System.organizations(
            endpoint: filter
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.OrganizationsGetResponse.self,
            authorization: true
        ).organizations
    }
    
    // MARK: - PickupBranchesGet
    
    /// Returns a list of valid pickup branches based on the organization ID. The passed-in organization ID is typically the registered branch of the patron placing a hold request or changing the pickup location of an existing request. The endpoint returns a list of branch-level organization IDs.
    /// - note: PAPI method name: `PickupBranchesGet`
    
    public static func pickupBranches() async throws -> [Polaris.System.PickupBranchesGetResponse.PickupBranch] {
        let endpoint = HTTPClient.Endpoint.System.pickupBranches
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.PickupBranchesGetResponse.self,
            authorization: true
        ).pickupBranches
    }
    
    // MARK: - PatronCodesGetResult
    
    /// This method returns a list of valid patron codes. If the specified organization ID does not exist, an error is returned (Invalid OrgID supplied, -5000).
    /// - note: PAPI method name: `PatronCodesGetResult`
    
    public static func patronCodes() async throws -> [Polaris.System.PatronCodesGetResultResponse.PatronCode] {
        let endpoint = HTTPClient.Endpoint.System.patronCodes
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.PatronCodesGetResultResponse.self,
            authorization: true
        ).patronCodes
    }
    
    // MARK: - ShelfLocationsGet
    
    /// Returns a list of shelf locations based on the organization ID. Branches utilize a subset of shelf locations. To retrieve a list of all shelf locations in the system, pass in an organization ID of 1. To retrieve a list of shelf locations for a specific branch, pass in the branch ID.
    /// - note: PAPI method name: `ShelfLocationsGet`
    /// - parameter organization: The ID of the oranization.
    
    public static func shelfLocations(
        organization: Int
    ) async throws -> [Polaris.System.ShelfLocationsGetResponse.ShelfLocation] {
        let endpoint = HTTPClient.Endpoint.System.shelfLocations(
            organization: organization
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.ShelfLocationsGetResponse.self,
            authorization: true
        ).shelfLocations
    }
    
    // MARK: - RemoteStorageItemsGet
    
    /// This protected method returns a list of items that match the criteria specified by the user. The data returned includes the detailed item information designed to update remote storage repositories for new, updated, and deleted items. The list may be paged using the startitemrecordid parameter.
    /// - note: PAPI method name: `RemoteStorageItemsGet`
    /// - parameter branchID: The branch ID for the request list.
    /// - parameter startDate: The starting date for the delta.
    /// - parameter endDate: The ending date for the delta.
    /// - parameter maxItems: The number of items returned for the call.
    /// - parameter listType: The type of list returned.
    /// - parameter startItemRecordID: The item record ID after which to start the list.
    
    public static func remoteStorageItems(
        branch: Int,
        startDate: String,
        endDate: String,
        maxItems: Int,
        listType: Int,
        startPosition: Int?
    ) async throws -> [Polaris.System.RemoteStorageItemsGetResponse.RemoteStorageItem] {
        let endpoint = HTTPClient.Endpoint.System.remoteStorageItems(
            branch: branch,
            startDate: startDate,
            endDate: endDate,
            maxItems: maxItems,
            listType: listType,
            startPosition: startPosition
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.RemoteStorageItemsGetResponse.self,
            authorization: true
        ).remoteStorageItems
    }
    
    // MARK: - SAMobilePhoneCarriersGetResult
    
    /// Returns content from the SA_MobilePhoneCarriers table for a specified organization, which specifies the mobile phone carrier selections available for patron record phone fields.
    /// - note: PAPI method name: `SAMobilePhoneCarriersGetResult`
    /// - parameter completion: The completion handler containing the response from the ILS or an error if the request is not successful.
    
    public static func mobilePhoneCarriers() async throws -> [Polaris.System.SAMobilePhoneCarriersGetResultResponse.MobilePhoneCarrier] {
        let endpoint = HTTPClient.Endpoint.System.mobilePhoneCarriers
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.SAMobilePhoneCarriersGetResultResponse.self,
            authorization: true
        ).carriers
    }
    
    // MARK: - SortOptionsGet
    
    /// Returns list of valid sort options.
    /// - note: PAPI method name: `SortOptionsGet`
    
    public static func sortOptions() async throws -> [Polaris.System.SortOptionsGetResponse.SortOption] {
        let endpoint = HTTPClient.Endpoint.System.sortOptions
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.SortOptionsGetResponse.self,
            authorization: true
        ).options
    }
    
    // MARK: - UpdatePickupBranchID
    
    /// This method updates the pickup branch for a hold request when the patron requests the change. The hold request status must be one that is allowed for change requests according to the system-level Polaris Administration setting for the Request parameter Holds Options - Pickup. Possible allowed statuses include Active, Held, Inactive, Located, Pending, and Shipped.
    /// - note: PAPI method name: `UpdatePickupBranchID`
    /// - parameter request: ID of the hold request.
    /// - parameter barcode: The patron's barcode.
    /// - parameter workstation: ID of the workstation making the endpoint call. This is used in checking if the caller has permission to update the pickup branch.
    /// - parameter user: ID of the Polaris user making the endpoint call. This is used in checking if the caller has permission to update the pickup branch.
    /// - parameter branch: Internal branch ID that the existing hold request should be changed to.
    
    public static func updatePickupBranchID(
        request: Int,
        barcode: String,
        branch: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.System.updatePickupBranchID(
            barcode: barcode,
            id: request,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            branch: branch
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.UpdatePickupBranchResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - RequestsUpdateStatus
    
    /// This protected method will update the request status.
    /// - note: PAPI method name: `RequestsUpdateStatus`
    /// - parameter id: The request being acted upon.
    /// - parameter action: The action being taken.
    /// - parameter item: The ItemRecordID of the item bound to the request.
    /// - parameter deny: The ReasonID from the table HoldUser- NotSuppliedReasons. This value is required for the “deny” action.
    
    public static func requestUpdateStatus(
        id: Int,
        action: String,
        item: Int?,
        deny: Int?
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.System.updateRequestStatus(
            id: id,
            action: action,
            item: item,
            deny: deny
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.System.RequestsUpdateStatusResponse.self,
            authorization: true
        ).error == nil
    }
}
