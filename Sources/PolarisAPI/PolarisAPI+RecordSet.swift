import Foundation

extension PolarisAPI.RecordSet {
        
    // MARK: - RecordSetRecordsGet
    
    /// Returns a list of record IDs in a specified patron record set.
    /// - note: PAPI method name: `RecordSetRecordsGet`
    /// - parameter id: The ID of the patron record set.
    /// - parameter startIndex: The first patron record to be returned, relative to the beginning of the record set.
    /// - parameter numberOfRecords: The total number of records to return.
    
    public static func get(
        id: Int,
        startIndex index: Int = 0,
        numberOfRecords records: Int = 1000
    ) async throws -> [Polaris.RecordSet.RecordSetRecordsGetResponse.Patron] {
        let endpoint = HTTPClient.Endpoint.RecordSet.get(
            id: id,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            startIndex: index,
            numberOfRecords: records
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.RecordSet.RecordSetRecordsGetResponse.self,
            authorization: true
        ).patrons
    }
    
    // MARK: - RecordSetContentPut (Add)
    
    /// Adds records to a patron record set.
    /// - note: PAPI method name: `RecordSetContentPut`
    /// - parameter patrons: An array of Patron IDs to add.
    /// - parameter id: The ID of the patron record set.
    
    public static func add(
        patrons: [Int],
        to id: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.RecordSet.add(
            id: id,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1
        )
        let request = Polaris.RecordSet.RecordSetContentPutRequest(
            patrons: patrons.commaDelimitedString
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.RecordSet.RecordSetContentPutResponse.self
        ).error == nil
    }
    
    // MARK: - RecordSetContentPut (Remove)
    
    /// Removes records from a patron record set.
    /// - note: PAPI method name: `RecordSetContentPut`
    /// - parameter patrons: An array of Patron IDs to remove.
    /// - parameter id: The ID of the patron record set.
    
    public static func remove(
        patrons: [Int],
        from id: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.RecordSet.remove(
            id: id,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1
        )
        let request = Polaris.RecordSet.RecordSetContentPutRequest(
            patrons: patrons.commaDelimitedString
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.RecordSet.RecordSetContentPutResponse.self
        ).error == nil
    }
}
