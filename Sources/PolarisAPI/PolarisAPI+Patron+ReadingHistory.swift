import Foundation

extension PolarisAPI.Patron.ReadingHistory {
    
    // MARK: - PatronReadingHistoryClear
    
    /// Clears the historical list of items a patron has checked out. Supplying a list of reading history IDs will remove only the specified historical entries.
    /// - note: PAPI method name: `PatronReadingHistoryClear`
    /// - parameter barcode: The patron's barcode.
    /// - parameter list: An array of reading history IDs.
    
    public static func clear(
        barcode: String,
        list: [Int]?
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.ReadingHistory.clear(
            barcode: barcode,
            list: list
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.ReadingHistory.PatronReadingHistoryClearResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronReadingHistoryGet
    
    /// Returns a historical list of items the patron has checked out. The procedure is capable of returning a count of the total number of titles in the patron’s check-out history, a list of all titles in the history, or a specific page of titles of a specified length.
    /// - note: PAPI method name: `PatronReadingHistoryGet`
    /// - parameter barcode: The patron's barcode.
    /// - parameter page: The page returned by the query. -1 = Return count only; 0 = Return all rows; >0 = Start page.
    /// - parameter resultsPerPage: The number of results returned per page.
    
    public static func get(
        barcode: String,
        page: Int = 0,
        resultsPerPage: Int = 25
    ) async throws -> [Polaris.Patron.ReadingHistory.PatronReadingHistoryGetResponse.Item] {
        let endpoint = HTTPClient.Endpoint.Patron.ReadingHistory.get(
            barcode: barcode,
            page: page,
            resultsPerPage: resultsPerPage
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.ReadingHistory.PatronReadingHistoryGetResponse.self,
            authorization: true
        ).items
    }
}
