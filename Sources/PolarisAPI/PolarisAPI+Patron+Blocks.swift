import Foundation

extension PolarisAPI.Patron.Blocks {
    
    // MARK: - PatronCirculateBlocksGet
    
    /// Validate that a patron is part of the Polaris database, and return blocks and status telling the caller if the given patron is allowed to perform a circulation activity (checkout).
    /// - note: PAPI method name: `PatronCirculateBlocksGet`
    /// - parameter barcode: The barcode of the patron.
    
    public static func circulation(
        barcode: String
    ) async throws -> Polaris.Patron.Blocks.PatronCirculateBlocksGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.Blocks.circulation(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Blocks.PatronCirculateBlocksGetResponse.self,
            authorization: true
        )
    }
    
    // MARK: - CreatePatronBlocks
    
    /// This protected method creates a block on a patron record. A call to AuthenticateStaffUser is required before calling any protected method. See below for a list of valid block types for patron records. Blocks are de-duplicated on creation. Duplicate blocks are not allowed.
    /// - note: PAPI method name: `CreatePatronBlocks`
    /// - parameter type: The type of block.
    /// - parameter value: The block value.
    /// - parameter barcode: The patron's barcode.
    
    public static func create(
        type: Int,
        value: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Blocks.create(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1
        )
        let request = Polaris.Patron.Blocks.CreatePatronBlocksRequest(
            type: type,
            value: value
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Blocks.CreatePatronBlocksResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronRenewBlocksGet
    
    /// This method takes in a Patron ID and returns patron renewal blocks (if any). It also indicates whether the patron is allowed to renew (the blocks may be informational or actual blocks). It is a protected method and staff must authenticate before calling this method.
    /// - note: PAPI method name: `PatronRenewBlocksGet`
    /// - parameter patron: The patron's unique ID.
    
    public static func renew(
        patron: Int
    ) async throws -> Polaris.Patron.Blocks.PatronRenewBlocksGetResponse {
        let endpoint = HTTPClient.Endpoint.Patron.Blocks.renew(
            id: patron
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Blocks.PatronRenewBlocksGetResponse.self,
            authorization: true
        )
    }
}
