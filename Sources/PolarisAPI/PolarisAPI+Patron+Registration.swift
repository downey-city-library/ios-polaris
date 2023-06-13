import Foundation

extension PolarisAPI.Patron.Registration {

    // MARK: - PatronRegistrationCreate
    
    /// Create a new patron registration record. Basic patron duplicate detection (name, username, barcode) is performed.
    /// - note: PAPI method name: `PatronRegistrationCreate`
    /// - parameter request: The registration object containing patron data.
    
    public static func create(
        request: Polaris.Patron.Registration.PatronRegistrationCreateRequest
    ) async throws -> Polaris.Patron.Registration.PatronRegistrationCreateResponse {
        let endpoint = HTTPClient.Endpoint.Patron.Registration.create
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Registration.PatronRegistrationCreateResponse.self
        )
    }
    
    // MARK: - PatronRegistrationUpdate
    
    /// Update Patron Registration information.
    /// - note: PAPI method name: `PatronRegistrationUpdate`
    /// - parameter barcode: The barcode of the patron.
    /// - parameter request: The registration object containing patron data.
    
    public static func update(
        barcode: String,
        request: Polaris.Patron.Registration.PatronRegistrationUpdateRequest
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Registration.update(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Registration.PatronRegistrationUpdateResponse.self
        ).error == nil
    }
}
