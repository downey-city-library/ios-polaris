import Foundation

extension PolarisAPI.Patron.Account {
    
    // MARK: - PatronAccountGet
    
    /// Returns list of fines and fees associated with a specified patron. The list can be filtered by outstanding (current) or reconciled (historical) fines and fees..
    /// - note: PAPI method name: `PatronAccountGet`
    /// - parameter barcode: The patron's barcode.
    /// - parameter endpoint: Display either outstanding or reconciled charges.
    
    public static func get(
        barcode: String,
        endpoint: String
    ) async throws -> [Polaris.Patron.Account.PatronAccountGetResponse.Transaction] {
        let endpoint = HTTPClient.Endpoint.Patron.Account.get(
            barcode: barcode,
            endpoint: endpoint
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Account.PatronAccountGetResponse.self,
            authorization: true
        ).transactions
    }
    
    // MARK: - PatronAccountPay
    
    /// Makes a payment on an existing charge on the Polaris patron account.
    /// - note: PAPI method name: `PatronAccountPay`
    /// - parameter barcode: The patron's barcode.
    /// - parameter transaction: Polaris charge transaction ID.
    /// - parameter amount: The amount to be paid.
    /// - parameter paymentMethod: The ID of the desired payment method.
    /// - parameter note: A free text note to include with the payment.
    
    public static func pay(
        amount: Double,
        transaction: Int,
        paymentMethod: Int,
        note: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.pay(
            barcode: barcode,
            transaction: transaction,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        let request = Polaris.Patron.Account.PatronAccountPayRequest(
            amount: amount,
            paymentMethod: paymentMethod,
            note: note
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountPayResponse.self
        ).error == nil
    }
    
    // MARK: - PatronAccountPayAll
    
    /// This method takes a payment amount, a note, and a payment method, and applies the payments to all patron charges, paying off the oldest charges first. It allows a partial pay all, but not an overpayment. If the amount is greater than the amount the patron currently owes in charges, a -3610 error is returned.
    /// - note: PAPI method name: `PatronAccountPayAll`
    /// - parameter barcode: The patron's barcode.
    /// - parameter amount: The amount to be paid.
    /// - parameter paymentMethod: The ID of the desired payment method.
    /// - parameter note: A free text note to include with the payment.
    
    public static func payAll(
        amount: Double,
        paymentMethod: Int,
        note: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.payAll(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        let request = Polaris.Patron.Account.PatronAccountPayRequest(
            amount: amount,
            paymentMethod: paymentMethod,
            note: note
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountPayResponse.self
        ).error == nil
    }
    
    // MARK: - PatronAccountVoid
    
    /// This delete method voids a patron payment on the Polaris patron account. It restores the paid balance to the associated charge and the associated credit (if it was paid originally with a patron’s existing credit). The change has no impact on credit card processing; it simply voids the payment from the PatronAccount table, and a 6042 transaction is logged.
    /// - note: PAPI method name: `PatronAccountVoid`
    /// - parameter barcode: The patron's barcode.
    /// - parameter transactionID: Polaris void payment transaction ID.
    
    public static func void(
        transaction: Int,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.void(
            barcode: barcode,
            transaction: transaction,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Account.PatronAccountVoidResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronAccountCreateCredit
    
    /// This method creates a credit on the Polaris patron account.
    /// - note: PAPI method name: `PatronAccountCreateCredit`
    /// - parameter amount: The amount of the credit.
    /// - parameter paymentMethod: The ID of the desired payment method.
    /// - parameter note: A free text note to include with the credit.
    /// - parameter barcode: The patron's barcode.
    
    public static func createCredit(
        amount: Double,
        paymentMethod: Int,
        note: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.createCredit(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        let request = Polaris.Patron.Account.PatronAccountCreateCreditRequest(
            amount: amount,
            paymentMethodID: paymentMethod,
            note: note
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountCreateCreditResponse.self
        ).error == nil
    }
    
    // MARK: - PatronAccountDepositCredit
    
    /// This method deposits credits on the Polaris patron account, with the oldest credits processed first.
    /// - note: PAPI method name: `PatronAccountDepositCredit`
    /// - parameter amount: The amount of the credit.
    /// - parameter note: A free text note to include with the credit.
    /// - parameter barcode: The patron's barcode.
    
    public static func depositCredit(
        amount: Double,
        note: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.depositCredit(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        let request = Polaris.Patron.Account.PatronAccountDepositCreditRequest(
            amount: amount,
            note: note
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountDepositCreditResponse.self
        ).error == nil
    }
    
    // MARK: - PatronAccountRefundCredit
    
    /// This method refunds credits on the Polaris patron account, with the oldest credits processed first.
    /// - note: PAPI method name: `PatronAccountRefundCredit`
    /// - parameter amount: The amount of the refund.
    /// - parameter note: A free text note to include with the refund.
    /// - parameter barcode: The patron's barcode.
    
    public static func refundCredit(
        amount: Double,
        note: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.refundCredit(
            barcode: barcode,
            workstation: Polaris.authenticatedStaffUser?.workstation ?? -1,
            user: Polaris.authenticatedStaffUser?.id ?? -1
        )
        let request = Polaris.Patron.Account.PatronAccountRefundCreditRequest(
            amount: amount,
            note: note
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountRefundCreditResponse.self
        ).error == nil
    }
    
    // MARK: - PatronAccountCreateTitleList
    
    /// Creates a named title list in the patron account.
    /// - note: PAPI method name: `PatronAccountCreateTitleList`
    /// - parameter name: Name of the list being created.
    /// - parameter barcode: The patron's barcode.
    
    public static func createTitleList(
        name: String,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.createTitleList(
            barcode: barcode
        )
        let request = Polaris.Patron.Account.PatronAccountCreateTitleListRequest(
            name: name
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            requestBody: request,
            responseType: Polaris.Patron.Account.PatronAccountCreateTitleListResponse.self,
            authorization: true
        ).error == nil
    }
    
    // MARK: - PatronAccountGetTitleLists
    
    /// Returns a list of all title lists in a patron's account.
    /// - note: PAPI method name: `PatronAccountGetTitleLists`
    /// - parameter barcode: The patron's barcode.
    
    public static func getTitleLists(
        barcode: String
    ) async throws -> [Polaris.Patron.Account.PatronAccountGetTitleListsResponse.TitleList] {
        let endpoint = HTTPClient.Endpoint.Patron.Account.getTitleLists(
            barcode: barcode
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Account.PatronAccountGetTitleListsResponse.self,
            authorization: true
        ).lists
    }
    
    // MARK: - PatronAccountDeleteTitleList
    
    /// Deletes the specified existing named title list on the patron account.
    /// - note: PAPI method name: `PatronAccountDeleteTitleList`
    /// - parameter list: The unique identifier for the list. 
    /// - parameter barcode: The patron's barcode.
    
    public static func deleteTitleList(
        list: Int,
        barcode: String
    ) async throws -> Bool {
        let endpoint = HTTPClient.Endpoint.Patron.Account.deleteTitleList(
            barcode: barcode,
            list: list
        )
        return try await PolarisAPI.performRequest(
            endpoint: endpoint,
            responseType: Polaris.Patron.Account.PatronAccountDeleteTitleListResponse.self,
            authorization: true
        ).error == nil
    }
}
