import Foundation

extension PolarisAPI.Patron.Message {

    // MARK: - PatronMessagesGet
    
    /// Retrieves a list of new and read patron messages.
    ///- note: PAPI method name: `PatronMessagesGet`
    ///- parameter barcode: The patron's barcode.
    
    public static func get(
        barcode: String
    ) async throws -> [Polaris.Patron.Message.PatronMessagesGetResponse.Message] {
        let endpoint = HTTPClient.Endpoint.Patron.Message.get(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Message.PatronMessagesGetResponse.self,
            authorization: true
        ).messages
    }
    
    // MARK: - PatronMessageUpdateStatus
    
    /// Marks a message as read.
    /// - note: PAPI method name: `PatronMessageUpdateStatus`
    /// - parameter id: The ID of the patron message.
    /// - parameter type: The type of message.
    /// - parameter barcode: The patron's barcode.
    
    public static func updateStatus(
        id: Int,
        type: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Message.updateStatus(
            barcode: barcode,
            type: type,
            id: id
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Message.PatronMessageUpdateStatusResponse.self
        ).error == nil
    }
    
    // MARK: - PatronMessageDelete
    
    /// Delete a specific patron message.
    /// - note: PAPI method name: `PatronMessageDelete`
    /// - parameter id: The ID of the patron message.
    /// - parameter type: The type of message.
    /// - parameter barcode: The patron's barcode.
    
    public static func delete(
        id: Int,
        type: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Message.delete(
            barcode: barcode,
            type: type,
            id: id
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Message.PatronMessageDeleteResponse.self,
            authorization: true
        ).error == nil
    }
}
