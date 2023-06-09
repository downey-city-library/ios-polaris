import Foundation

extension PolarisAPI.HoldRequest {
    
    // MARK: - HoldRequestActivate
    
    /// Suspend a single hold request.
    /// - note: PAPI method name: `HoldRequestSuspend`
    /// - parameter barcode: The barcode of the patron with the hold request.
    /// - parameter id: The ID of the hold request.
    
    public static func activate(
        barcode: String,
        id: Int
    ) async throws -> [Polaris.HoldRequest.HoldRequestActivateResponse.ActivatedHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.activate(
            barcode: barcode,
            id: id
        )
        let request = Polaris.HoldRequest.HoldRequestActivateRequest(
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            activationDate: Date()
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestActivateResponse.self
        ).activatedHolds
    }
    
    // MARK: - HoldRequestActivateAllForPatron
    
    /// Suspend all hold requests for a patron.
    /// - note: PAPI method name: `HoldRequestSuspend`
    /// - parameter barcode: The barcode of the patron with the hold requests.
    
    public static func activateAll(
        barcode: String
    ) async throws -> [Polaris.HoldRequest.HoldRequestActivateResponse.ActivatedHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.activateAll(
            barcode: barcode
        )
        let request = Polaris.HoldRequest.HoldRequestActivateRequest(
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            activationDate: Date()
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestActivateResponse.self
        ).activatedHolds
    }
    
    // MARK: - HoldRequestCancel
    
    /// Cancel a single hold request for a specific patron.
    /// - note: The following hold statuses can be cancelled:
    ///   -- 1 - inactive
    ///   -- 2 - active
    ///   -- 4 - pending
    ///   -- 5 - shipped (if enabled by the library)
    /// - note: PAPI method name: `HoldRequestCancel`
    /// - parameter barcode: The barcode of the patron with the hold request.
    /// - parameter id: The hold request ID number.
    
    public static func cancel(
        barcode: String,
        id: Int
    ) async throws -> [Polaris.HoldRequest.HoldRequestCancelResponse.CancelledHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.cancel(
            barcode: barcode,
            id: id,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
//        let request = Polaris.HoldRequest.CancelRequest(
//            userID: userID,
//            workstationID: workstationID
//        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
//            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestCancelResponse.self
        ).cancelledHolds
    }
    
    // MARK: - HoldRequestCancelAllForPatron
    
    /// Cancel all hold requests for a specific patron.
    /// - note: The following hold statuses can be cancelled:
    ///   -- 1 - inactive
    ///   -- 2 - active
    ///   -- 4 - pending
    ///   -- 5 - shipped (if enabled by the library)
    /// - note: PAPI method name: `HoldRequestCancelAllForPatron`
    /// - parameter barcode: The barcode of the patron with the hold request.
    
    public static func cancelAll(
        barcode: String
    ) async throws -> [Polaris.HoldRequest.HoldRequestCancelResponse.CancelledHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.cancelAll(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
//        let request = Polaris.HoldRequest.CancelRequest(
//            userID: userID,
//            workstationID: workstationID
//        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
//            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestCancelResponse.self
        ).cancelledHolds
    }
    
    // MARK: - HoldRequestCreate
    
    /// Start the local hold request process.
    /// - important: This process is based on a “messaging” system and will allow a Polaris patron to place a local hold request. After calling the `create` method, one or more calls to the `reply` method may be required. The message exchange is complete when a StatusType of Error (1) or Answer (2) is returned or if an error is raised by a database exception.
    /// - note: PAPI method name: `HoldRequestCreate`
    /// - parameter request: The object to be POSTed containing the patron barcode, biographic ID among various other properties.
    
    public static func create(
        _ request: Polaris.HoldRequest.HoldRequestCreateRequest
    ) async throws -> Polaris.HoldRequest.HoldRequestCreateResponse {
        let endpoint = HTTPClient.Endpoint.HoldRequest.create
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestCreateResponse.self
        )
    }
    
    // MARK: - HoldRequestGetList
    
    /// Returns a list of hold requests that match the criteria specified by the user. The data returned includes the detailed request, patron, item, and title information.
    /// - note: PAPI method name: `HoldRequestGetList`
    /// - parameter branch: The branch ID for the request list.
    /// - parameter branchType: The type of branch specified. Valid values include: 1 - Patron's Branch; 2 - Pickup Branch; 3 - Item Branch.
    /// - parameter status: The desired status of requests returned.
    
    public static func getList(
        branch: Int,
        branchType: Int,
        status: Int
    ) async throws -> [Polaris.HoldRequest.HoldRequestGetListResponse.HoldRequest] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.getList(
            branch: branch,
            branchType: branchType,
            status: status
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.HoldRequest.HoldRequestGetListResponse.self,
            authorization: true
        ).holdRequests
    }
    
    // MARK: - HoldRequestReply
    
    /// Send a reply message responding to the results of a previous HoldRequestCreate or HoldRequestReply procedure call.
    /// - important: The HoldRequestCreate procedure must be called before executing this procedure. The RequestGUID, TxnGroupQualifier and TxnQualifier returned by the HoldRequestCreate procedure will be used as input parameters for this procedure call. These three values connect the messages together to create an ILL conversation. After calling the HoldRequestReply procedure, one or more calls to the HoldRequestReply procedure may be required. The message exchange is complete when a StatusType of Error (1) or Answer (2) is returned or if an error is raised via a database exception.
    /// - note: PAPI method name: `HoldRequestReply`
    /// - parameter answer: Answer to conditional create request. Valid answers include: yes or no.
    /// - parameter response: The original create request.
    /// - parameter organizationID: The ID of the oranization.
    
    public static func reply(
        _ answer: Polaris.HoldRequest.HoldRequestReplyRequest.Answer,
        to response: Polaris.HoldRequest.HoldRequestCreateResponse,
        organizationID: Int
    ) async throws -> Polaris.HoldRequest.HoldRequestReplyResponse {
        let endpoint = HTTPClient.Endpoint.HoldRequest.reply(
            guid: response.guid
        )
        var state: Polaris.HoldRequest.HoldRequestReplyRequest.State
        switch response.status.value {
        case .conditionalAcceptILLPolicy: state = .illPolicy
        case .conditionalAcceptLocalHoldPolicy: state = .localPolicy
        case .conditionalAvailableLocally: state = .availableLocally
        case .conditionalExistingHolds: state = .existingHolds
        case .conditionalNoItemsAttached: state = .noItems
        default: state = .noItems
        }
        let request = Polaris.HoldRequest.HoldRequestReplyRequest(
            groupQualifier: response.transaction.groupQualifier,
            transactionQualifier: response.transaction.qualifier,
            organization: organizationID,
            answer: answer,
            state: state
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestReplyResponse.self
        )
    }
    
    // MARK: - HoldRequestSuspend
    
    /// Suspend a single hold request.
    /// - note: PAPI method name: `HoldRequestSuspend`
    /// - parameter id: The ID of the hold request.
    /// - parameter activationDate: The date in which the hold should reactivate.
    /// - parameter barcode: The barcode of the patron with the hold request.
    
    public static func suspend(
        _ id: Int,
        until activationDate: Date,
        barcode: String
    ) async throws -> [Polaris.HoldRequest.HoldRequestSuspendResponse.SuspendedHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.suspend(
            barcode: barcode,
            id: id
        )
        let request = Polaris.HoldRequest.HoldRequestSuspendRequest(
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            activationDate: activationDate
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestSuspendResponse.self
        ).suspendedHolds
    }
    
    // MARK: - HoldRequestSuspendAllForPatron
    
    /// Suspend all hold requests for a patron.
    /// - note: PAPI method name: `HoldRequestSuspend`
    /// - parameter activationDate: The date in which the holds should reactivate.
    /// - parameter barcode: The barcode of the patron with the hold requests.
    
    public static func suspendAll(
        until activationDate: Date,
        barcode: String
    ) async throws -> [Polaris.HoldRequest.HoldRequestSuspendResponse.SuspendedHold] {
        let endpoint = HTTPClient.Endpoint.HoldRequest.suspendAll(
            barcode: barcode
        )
        let request = Polaris.HoldRequest.HoldRequestSuspendRequest(
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            activationDate: activationDate
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.HoldRequest.HoldRequestSuspendResponse.self
        ).suspendedHolds
    }
}
