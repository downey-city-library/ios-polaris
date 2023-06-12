import Foundation

extension PolarisAPI.Item {
    
    // MARK: - ItemRenew
    
    /// Attempt to renew an item that is already checked out.
    /// - note: PAPI method name: `ItemRenew`
    /// - parameter barcode: The barcode of the patron requesting the renewal.
    /// - parameter ID: The record ID of the item being renewed.
    /// - parameter request: The renewal request object.
    /// - parameter ignoreErrors: Ignore any errors thatcan be ignored and if possible continue processing.
    
    public static func renew(
        barcode: String,
        id: Int,
        ignoreErrors: Bool
    ) async throws -> Polaris.Item.ItemRenewResponse.Result {
        let endpoint = HTTPClient.Endpoint.Item.renew(
            barcode: barcode,
            id: id
        )
        let request = Polaris.Item.ItemRenewRequest(
            branch: Polaris.authenticatedStaffUser?.branch ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            ignoreErrors: ignoreErrors
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Item.ItemRenewResponse.self
        ).result
    }
        
    // MARK: - ItemRenewAllForPatron
    
    /// Attempt to renew all items currently out to a patron.
    /// - note: PAPI method name: `ItemRenewAllForPatron`
    /// - parameter barcode: The patron's barcode.
    /// - parameter ignoreErrors: Ignore any errors thatcan be ignored and if possible continue processing.
    
    public static func renewAll(
        barcode: String,
        ignoreErrors: Bool
    ) async throws -> Polaris.Item.ItemRenewResponse.Result {
        let endpoint = HTTPClient.Endpoint.Item.renewAll(
            barcode: barcode
        )
        let request = Polaris.Item.ItemRenewRequest(
            branch: Polaris.authenticatedStaffUser?.branch ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            ignoreErrors: ignoreErrors
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Item.ItemRenewResponse.self
        ).result
    }
    
    // MARK: - ItemUpdateBarcode
    
    /// This protected method allows a user to update the barcode for an existing item record or barcode when a barcode is changed or replaced. It writes a 3009 transaction (item record updated), creates an item record history action, and updates the item’s barcode.
    /// - note: PAPI method name: `ItemUpdateBarcode`
    /// - parameter currentBarcode: The barcode current assigned to the item. Use currentBarcode or id for identifying the item; not both.
    /// - parameter id: The unique identifier for the item. Use id or currentBarcode for identifying the item; not both.
    /// - parameter newBarcode: The new barcode for the item.
    
    public static func updateBarcode(
        currentBarcode: String?,
        id: Int?,
        newBarcode: String
    ) async throws -> Bool {
        guard
            let authenticatedStaffUser = Polaris.authenticatedStaffUser
        else {
            throw PolarisError.polarisUserNotPermitted
        }

        let endpoint = HTTPClient.Endpoint.Item.updateBarcode(
            barcode: currentBarcode,
            id: id,
            workstation: authenticatedStaffUser.workstation
        )
        let request = Polaris.Item.ItemUpdateBarcodeRequest(
            branch: authenticatedStaffUser.branch,
            barcode: newBarcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Item.ItemUpdateBarcodeResponse.self
        ).error == nil
    }
}
