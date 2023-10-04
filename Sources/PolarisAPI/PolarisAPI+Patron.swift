import Foundation

extension PolarisAPI.Patron {
    
    // MARK: - PatronBasicDataGet
    
    /// Returns basic name, address, circulation counts, and account balances for a patron.
    /// - note: PAPI method name: `PatronBasicDataGet`
    /// - parameter barcode: The barcode of the patron.

    public static func basicData(
        barcode: String
    ) async throws -> Polaris.Patron.BasicDataResponse {
        let endpoint = HTTPClient.Endpoint.Patron.basicData(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.BasicDataResponse.self,
            authorization: true
        )
    }
    
    // MARK: - PatronHoldRequestsGet
    
    /// Returns a list of hold requests placed by the specified patron. The list can be filtered by all hold requests or by the request status.
    /// - note: PAPI method name: `PatronHoldRequestsGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter set: The status of the holds to be returned.
    
    public static func holdRequests(
        barcode: String,
        set: Polaris.Patron.HoldRequestSet
    ) async throws -> Polaris.Patron.PatronHoldRequestsGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.holdRequests(
            barcode: barcode,
            endpoint: set.string
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronHoldRequestsGetResponse.self,
            authorization: true
        )
    }
    
    // MARK: - PatronILLRequestsGet
    
    /// This method returns a list of ILL requests placed by the specified patron. The list can be filtered by the status of the request.
    /// - note: PAPI method name: `PatronILLRequestsGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter set: The status of the requests to be returned.
    
    public static func ILLRequests(
        barcode: String,
        set: Polaris.Patron.ILLRequestSet
    ) async throws -> Polaris.Patron.PatronILLRequestsGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.ILLRequests(
            barcode: barcode,
            endpoint: set.string
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronILLRequestsGetResponse.self,
            authorization: true
        )
    }
    
    // MARK: - PatronItemsOutGet
    
    /// Returns list of items out to the specified patron.
    /// - important: The list can be filtered by `ALL` items out, `OVERDUE` items only, or `LOST` items only.
    /// - note: PAPI method name: `PatronItemsOutGet`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter set: The status of the items to be returned.
    
    public static func itemsOut(
        barcode: String,
        set: Polaris.Item.Set
    ) async throws -> Polaris.Patron.PatronItemsOutGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.items(
            barcode: barcode,
            endpoint: set.string
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronItemsOutGetResponse.self,
            authorization: true
        )
    }
    
    // MARK: - PatronPreferencesGet
    
    /// Return preferences for a patron including reading list, email format, and notification type.
    /// - note: PAPI method name: `PatronPreferencesGet`
    /// - parameter barcode: The barcode of the patron.

    public static func preferences(
        barcode: String
    ) async throws -> Polaris.Patron.PatronPreferencesGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.preferences(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronPreferencesGetResponse.self,
            authorization: true
        )
    }
        
    // MARK: - PatronSavedSearchesGet
    
    /// Returns list of saved searches to the specified patron.
    /// - note: PAPI method name:  `PatronSavedSearchesGet`
    /// - parameter barcode: The patron's barcode.
    
    public static func savedSearches(
        barcode: String
    ) async throws -> [Polaris.Patron.PatronSavedSearchesGetResponse.SavedSearch] {
        let endpoint = HTTPClient.Endpoint.Patron.savedSearches(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronSavedSearchesGetResponse.self,
            authorization: true
        ).savedSearches
    }
    
    // MARK: - PatronSearch
    
    /// This protected method returns a list of patrons that match the search criteria specified in the CCL submitted by the user. Data returned includes the patron’s name, barcode, Polaris Patron ID, and Polaris Organization ID. This method offers query parameters that allow the user to specify the number of patrons, the sort order, and page of data to retrieve.
    /// - important: A call to AuthenticateStaffUser is required before calling any protected method.
    /// - note: PAPI method name: `PatronSearch`
    /// - parameter query: Common Command Language (CCL) snippet. Must be URL encoded.
    /// - parameter results: Maximum number of patrons to return default is 5.
    /// - parameter page: Page number - default is 1.
    /// - parameter sort: The sort order of the return values.
    
    public static func search(
        query: String,
        resultsPerPage results: Int = 5,
        page: Int = 1,
        sort: String? = nil
    ) async throws -> Polaris.Patron.PatronSearchResponse {
        let endpoint = HTTPClient.Endpoint.Patron.search(
            query: query,
            resultsPerPage: results,
            page: page,
            sort: sort
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronSearchResponse.self,
            authorization: true,
            ignoreErrors: true
        )
    }
    
    // MARK: - PatronUpdateUserName
    
    /// This method allows a third party to add/update a patron’s username.
    /// - note: PAPI method name: `PatronUpdateUserName`
    /// - parameter username: The new username associated with the patron.
    /// - parameter barcode: The patron’s barcode.
    
    public static func update(
        username: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.updateUsername(
            barcode: barcode,
            username: username
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronUpdateUsernameResponse.self
        ).error == nil
    }
    
    // MARK: - PatronValidate
    
    /// Validate that a patron is part of the Polaris database.
    /// - note: PAPI method name: `PatronValidate`
    /// - parameter barcode: The barcode of the patron. 
    
    public static func validate(
        _ barcode: String
    ) async throws -> Polaris.Patron.PatronValidateResponse {
        let endpoint = HTTPClient.Endpoint.Patron.validate(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.PatronValidateResponse.self,
            authorization: true
        )
    }
    
    public struct Account {}
    
    public struct Blocks {}
    
    public struct Message {}

    public struct ReadingHistory {}
    
    public struct Registration {}
    
    public struct TitleList {}
}
