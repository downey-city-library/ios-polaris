import Foundation

extension PolarisAPI.Patron.TitleList {
    
    // MARK: - PatronTitleListAddTitle
    
    /// Adds the specified bibliographic record to the specified list in the patron account.
    /// - note: PAPI method name: `PatronTitleListAddTitle`
    /// - parameter barcode: The patron's barcode.
    /// - parameter list: The unique identifier of the title list.
    /// - parameter itemName: Title of the item being added to the list. If present, element is ignored.
    /// - parameter controlNumber: Control number of the title.
    
    public static func add(
        barcode: String,
        list: Int,
        itemName: String?,
        controlNumber: Int
    ) async throws -> Polaris.Patron.TitleList.PatronTitleListAddTitleResponse {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.add(
            barcode: barcode
        )
        let request = Polaris.Patron.TitleList.PatronTitleListAddTitleRequest(
            id: list,
            name: itemName,
            controlNumber: controlNumber
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.TitleList.PatronTitleListAddTitleResponse.self,
            authorization: true
        )
    }
    
    // MARK: - PatronTitleListCopyTitle
    
    /// Copy a title from one list to another in a patron account.
    /// - note: PAPI method name: `PatronTitleListCopyTitle`
    /// - parameter barcode: The patron's barcode.
    /// - parameter originalList:The unique identifier of the list to copy the item from.
    /// - parameter originalListPosition: Position of the title in the list. Note: A negative RecordID (-990) can be submitted instead of the title's position. The RecordID is a Unique Identifier for a record in the title list from the underlying table IRRecords.RecordID. This is not the Control Number or the Bib Record ID. It can be obtained from the API call `PatronTitleListGetTitles`.
    /// - parameter desintationList: The unique identifier of the list to copy the item to.
    
    public static func copy(
        barcode: String,
        originalList: Int,
        originalListPosition: Int,
        destinatonList: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.copy(
            barcode: barcode
        )
        let request = Polaris.Patron.TitleList.PatronTitleListCopyTitleRequest(
            fromTitleList: originalList,
            fromPosition: originalListPosition,
            toTitleList: destinatonList
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.TitleList.PatronTitleListCopyTitleResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronTitleListCopyAllTitles
    
    /// Copy all titles from one list to another list in the patron account.
    /// - note: PAPI method name: `PatronTitleListCopyAllTitles`
    /// - parameter barcode: The patron's barcode.
    /// - parameter originalList:The unique identifier of the list to copy the item from.
    /// - parameter desintationList: The unique identifier of the list to copy the item to.'
    
    public static func copyAll(
        barcode: String,
        originalList: Int,
        destinationList: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.copyAll(
            barcode: barcode
        )
        let request = Polaris.Patron.TitleList.PatronTitleListCopyAllTitlesRequest(
            fromTitleList: originalList,
            toTitleList: destinationList
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.TitleList.PatronTitleListCopyAllTitlesResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronTitleListGetTitles
    
    /// Returns all titles, or a range of titles by position in the list, for a specified title list in the patron account.
    /// - note: PAPI method name: PatronTitleListGetTitles
    /// - parameter barcode: The patron's barcode.
    /// - parameter list: The unique identifier of the title list.
    /// - parameter startPosition: Position in the list of the first title to return.
    /// - parameter endPosition: Position in the list of the last title to return.
    
    public static func get(
        barcode: String,
        list: Int,
        startPosition: Int?,
        endPosition: Int?
    ) async throws -> [Polaris.Patron.TitleList.PatronTitleListGetTitlesResponse.Title] {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.get(
            barcode: barcode,
            list: list,
            startPosition: startPosition,
            endPosition: endPosition
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.TitleList.PatronTitleListGetTitlesResponse.self,
            authorization: true
        ).titles
    }
    
    // MARK: - PatronTitleListMoveTitle
    
    /// Moves a specified bibliographic record from one title list to another. Both title lists are in the same patron account.
    /// - note: PAPI method name: `PatronTitleListMoveTitle`
    /// - parameter barcode: The patron's barcode.
    /// - parameter originalList:The unique identifier of the list to copy the item from.
    /// - parameter originalListPosition: Position of the title in the list.
    /// - parameter desintationList: The unique identifier of the list to copy the item to.
    
    public static func move(
        barcode: String,
        originalList: Int,
        originalListPosition: Int,
        destinationList: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.move(
            barcode: barcode
        )
        let request = Polaris.Patron.TitleList.PatronTitleListMoveTitleRequest(
            fromTitleList: originalList,
            fromPosition: originalListPosition,
            toTitleList: destinationList
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.TitleList.PatronTitleListMoveTitleResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronTitleListDeleteTitle
    
    /// Deletes a single specified bibliographic record from the specified list in the patron account.
    /// - note: PAPI method name: `PatronTitleListDeleteTitle`
    /// - parameter barcode: The patron's barcode.
    /// - parameter list: The unique identifier of the list.
    /// - parameter position: The position of the title in the list.
    
    public static func delete(
        barcode: String,
        list: Int,
        position: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.delete(
            barcode: barcode,
            list: list,
            position: position
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.TitleList.PatronTitleListDeleteTitleResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronTitleListDeleteAllTitles
    
    /// Removes all the records from a given list, but leaves the empty list in the patron account.
    /// - note: PAPI method name: `PatronTitleListDeleteAllTitles`
    /// - parameter barcode: The patron's barcode.
    /// - parameter list: The unique identifier of the list.
    
    public static func deleteAll(
        barcode: String,
        list: Int
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.TitleList.deleteAll(
            barcode: barcode,
            list: list
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.TitleList.PatronTitleListDeleteAllTitlesResponse.self,
            authorization: true
        ).error == nil
    }
}
