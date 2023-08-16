import Foundation

extension PolarisAPI.Bib {
    
    // MARK: - TYPEALIASES
    public typealias Qualifier = Polaris.Qualifier
    public typealias SortBy = Polaris.SortBy
    
    // MARK: - BibBooleanSearch
    
    /// Returns a list of bibliographic records that match search criteria. For Boolean searches,
    /// you may opt to include the SORTBY clause when using the q query string parameter.
    /// This returns search results that are sorted in the specified sort order.
    /// - note: PAPI Method Name: `BibBooleanSearch`
    /// - parameter query: The terms used to conduct the keyword search.
    /// - parameter sortby: Determines how the results will be sorted.
    /// - parameter resultsPerPage: Determines how many results are returned per page. Default is 10.
    /// - parameter page: The page of results to be returned. Default is 1.
    /// - parameter limit: Partial CCL command. Use LimitFiltersGet for valid options.
    /// - parameter omitFromTransactionLog: Do not record search transaction in the Polaris Transactions database.
    
    public static func booleanSearch(
        query: String,
        sortby: SortBy?,
        resultsPerPage: Int?,
        page: Int?,
        limit: String?,
        omitFromTransactionLog: Bool?
    ) async throws -> [Polaris.Bib.BibBooleanSearchResponse.Bib] {
        let endpoint = HTTPClient.Endpoint.Bib.booleanSearch(
            query: query,
            sortby: sortby,
            resultsPerPage: resultsPerPage,
            page: page,
            limit: limit,
            omitFromTransactionLog: omitFromTransactionLog
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Bib.BibBooleanSearchResponse.self,
            authorization: true
        ).bibs
    }
    
    // MARK: - BibGet
    
    /// Returns bibliographic information for a specified record.
    /// - note: PAPI Method Name: `BibGet`
    /// - parameter id: The bibliographic ID number.
  
    public static func get(
        bibID id: Int
    ) async throws -> Polaris.Bib.BibGetResponse {
        let endpoint = HTTPClient.Endpoint.Bib.get(
            id: id
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Bib.BibGetResponse.self,
            authorization: true
        )
    }
        
    // MARK: - BibHoldingsGet
    
    /// Returns the holdings for a specified bibliographic record.
    /// - note: PAPI Method Name: `BibHoldingsGet`
    /// - parameter id: The bibliographic ID number.
    
    public static func holdings(
        bibID id: Int
    ) async throws -> [Polaris.Bib.BibHoldingsGetResponse.Holding] {
        let endpoint = HTTPClient.Endpoint.Bib.holdings(
            id: id
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Bib.BibHoldingsGetResponse.self,
            authorization: true
        ).holdings
    }
    
    // MARK: - BibKeywordSearch
    
    /// Returns list of bibliographic records that match the search criteria.
    /// - note: PAPI Method Name: `BibKeywordSearch`
    /// - parameter qualifier: The index referenced in the search.
    /// - parameter query: The terms used to conduct the keyword search.
    /// - parameter sortby: Determines how the results will be sorted.
    /// - parameter resultsPerPage: Determines how many results are returned per page. Default is 10.
    /// - parameter page: The page of results to be returned. Default is 1.
    /// - parameter limit: Partial CCL command. Use LimitFiltersGet for valid options.
    /// - parameter omitFromTransactionLog: Do not record search transaction in the Polaris Transactions database.

    public static func keywordSearch(
        qualifier: Polaris.Qualifier,
        query: String,
        sortby: SortBy?,
        resultsPerPage: Int?,
        page: Int?,
        limit: String?,
        omitFromTransactionLog: Bool?
    ) async throws -> Polaris.Bib.BibKeywordSearchResponse {
        let endpoint = HTTPClient.Endpoint.Bib.keywordSearch(
            qualifier: qualifier,
            query: query,
            sortby: sortby,
            resultsPerPage: resultsPerPage,
            page: page,
            limit: limit,
            omitFromTransactionLog: omitFromTransactionLog
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Bib.BibKeywordSearchResponse.self,
            authorization: false
        )
    }
}
