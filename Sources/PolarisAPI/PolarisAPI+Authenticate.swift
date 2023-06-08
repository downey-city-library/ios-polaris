import Foundation

extension PolarisAPI.Authenticate {
    
    // MARK: - AuthenticatePatron
    
    /// Authenticate a Patron.
    /// If successful, this method will return and store an AuthenticatedPatron object containing an access token and patron ID.
    /// - important: An authenticated patron is required before calling any public method requiring the patron's password. The access token will be used in place of the patron’s password when building the hash for secure patron methods.
    /// - note: PAPI method name: `AuthenticatePatron`
    /// - parameter barcode: The patron's barcode number.
    /// - parameter password: The patron's password or account PIN.
    /// - note: Upon a successful authentication the patron's barcode number is added to the AuthenticatedPatron object for future reference. The patron's barcode is not a standard part of the `AuthenticatePatron` response but has been added for convenience.
    
    public static func patron(
        barcode: String,
        password: String
    ) async throws -> Polaris.Authenticate.AuthenticatePatronResponse {
        let endpoint = HTTPClient.Endpoint.Authenticate.patron
        let request = Polaris.Authenticate.AuthenticatePatronRequest(
            barcode: barcode,
            password: password
        )
        var response = try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Authenticate.AuthenticatePatronResponse.self,
            authorization: true
        )
        response.set(barcode: barcode)
        Polaris.authenticatedPatron = response
        return response
    }
    
    // MARK: - AuthenticateStaffUser
    
    /// Authenticate a Staff User.
    /// If successful, this method will return and store an AuthenticatedStaffUser object containing an access token and access secret.
    /// - important: An authenticated staff user is required before calling any protected methods.
    /// - note: PAPI method name: `AuthenticateStaffUser`
    /// - note: This method signature without username and password parameters requires a default staff user username and password to be included in the PolarisAPI-Info.plsit file.
    
    public static func staffUser() async throws -> Polaris.Authenticate.AuthenticateStaffResponse {
        let configuration = PolarisConfiguration.shared
        let endpoint = HTTPClient.Endpoint.Authenticate.staffUser
        let request = Polaris.Authenticate.AuthenticateStaffRequest(
            domain: configuration.staffUser.domain,
            username: configuration.staffUser.username,
            password: configuration.staffUser.password
        )
        let response = try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Authenticate.AuthenticateStaffResponse.self,
            authorization: false
        )
        Polaris.authenticatedStaffUser = response
        return response
    }
    
    /// Authenticate a Staff User.
    /// If successful, this method will return and store an AuthenticatedStaffUser object containing an access token and access secret.
    /// - important: An authenticated staff user is required before calling any protected methods.
    /// - note: PAPI method name: `AuthenticateStaffUser`
    /// - parameter username: Staff username
    /// - parameter password: Staff password
    
    public static func staffUser(
        username: String,
        password: String
    ) async throws -> Polaris.Authenticate.AuthenticateStaffResponse {
        let configuration = PolarisConfiguration.shared
        let endpoint = HTTPClient.Endpoint.Authenticate.staffUser
        let request = Polaris.Authenticate.AuthenticateStaffRequest(
            domain: configuration.staffUser.domain,
            username: username,
            password: password
        )
        let response = try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Authenticate.AuthenticateStaffResponse.self,
            authorization: false
        )
        Polaris.authenticatedStaffUser = response
        return response
    }
}
