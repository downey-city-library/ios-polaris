//
//  PolarisError.swift
//  Polaris
//
//  Created by Andrew Despres on 8/16/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public enum PolarisError: Int, Error {
    
    // MARK: - General Errors
    case generalError = -1
    case multipleErrors = -2
    case partialError = -3
    case ermsError = -4
    
    // MARK: - Bibliographic Errors
    case invalidBibID = -1000
    
    // MARK: - Item/Holdings Errors
    case invalidItemID = -2000
    case invalidItemBarcode = -2001
    case duplicateItemBarcode = -2002
    case itemOut = -2003
    
    // MARK: - Patron Errors
    case failedToInsertAddress = -201
    case failedToInsertPostalCode = -221
    case patronInfoChangeNotAllowed = -501
    case patronDoesNotExist = -3000
    case failedToInsertPatron = -3001
    case failedToInsertPatronAddress = -3400
    case countryCodeDoesNotExist = -3500
    case patronBranchNotDefined = -3501
    case patronBranchNotValid = -3502
    case lastNameNotDefined = -3503
    case firstNameNotDefined = -3404
    case duplicatePatronBarcode = -3505
    case transactionBranchNotDefined = -3506
    case transactionUserNotDefined = -3507
    case transactionWorkstationNotDefined = -3508
    case passwordsDoNotMatch = -3509
    case cityStateCountyMismatch = -3510
    case cityStateMismatch = -3511
    case cityCountyMismatch = -3512
    case stateCountyMismatch = -3513
    case countyMismatch = -3514
    case stateMismatch = -3515
    case cityMismatch = -3516
    case postalCodeNotFound = -3517
    case invalidEmail = -3518
    case noAddress = -3519
    case noEmail = -3520
    case noPhoneVoice1 = -3521
    case noPhoneVoice2 = -3522
    case noPhoneVoice3 = -3523
    case noPhoneFax = -3524
    case invalidDeliveryMethod = -3525
    case invalidEmailFormat = -3526
    case invalidReadingList = -3527
    case duplicateName = -3528
    case duplicateUsername = -3529
    case failedToInsertPatronRegistration = -3530
    case invalidPhoneVoice1 = -3532
    case invalidPasswordFormat = -3533
    case invalidPasswordLength = -3534
    case passwordChangeNotAllowed = -3535
    case invalidChargeTransaction = -3600
    case invalidPatronChargeTransaction = -3601
    case invalidPaymentMethod = -3602
    case invalidPaymentAmount = -3603
    case invalidTransactionType = -3604
    case generalPatronAccount = -3605
    case invalidPaymentTransaction = -3606
    case invalidPatronPaymentTransaction = -3607
    case transactionCannotBeVoided = -3608
    case paymentMoreThanSum = -3610
    case invalidPatronCodeID = -3612
    case invalidPhoneVoice2 = -3613
    case invalidPhoneVoice3 = -3614
    case invalidAltEmail = -3615
    case invalidTxtPhoneNumber = -3616
    case invalidPhoneCarrier = -3617
    case noPhoneForDelivery = -3619
    case invalidReceiptEmail = -3620
    case patronIsSecure = -3621
    
    // MARK: - Hold Request Errors
    case invalidApplicationID = -4000
    case invalidPatronID = -4001
    case invalidWorkstationIDSupplied = -4002
    case invalidRequestID = -4003
    case invalidRequestingOrgID = -4004
    case invalidPatronBarcode = -4005
    case invalidBibRecordID = -4006
    case invalidPickupOrgID = -4007
    case cannotChangePickupBranch = -4016
    case invalidRequestGUID = -4100
    case invalidTransactionGroup = -4101
    case invalidTransactionQualifier = -4102
    case invalidAnswer = -4103
    case invalidState = -4104
    case invalidRequestIDSupplied = -4201
    case invalidCurrentOrgID = -4202
    case cancelDueToHeld = -4203
    case cancelDueToUnclaimed = -4204
    case cancelDueTocancelled = -4205
    case cancelDueToExpired = -4206
    case cancelDueToOutToPatron = -4207
    case cancelDueToShipped = -4208
    case noRequestsToCancel = -4300
    case invalidApplicationDate = -4400
    case needsApplicationDateLaterThanToday = -4401
    case needsApplicationDateEarlierThanTwoYears = -4402
    case invalidPickupBranch = -4403
    case loadingSA = -4404
    case invalidRequestStatus = -4405
    case noRequestsToSuspend = -4406
    case invalidRequestStatusForProcess = -4407
    case invalidRequestStatusChange = -4408
    case userNotSupplied = -4409
    case onlyItemAvailable = -4410
    case noOtherItemsAvailable = -4411
    
    // MARK: - Organization Errors
    case invalidOrgID = -5000
    
    // MARK: - Circulation Errors
    case invalidLoanUnit = -6000
    case invalidItemCheckoutRecord = -6001
    
    // MARK: - Course Reserve Errors
    case invalidCourseReserveID = -7000
    
    // MARK: - PolarisUser Errors
    case invalidPolarisUserID = -8000
    case polarisUserNotPermitted = -8001
    
    // MARK: - Workstation Errors
    case invalidWorkstationID = -9000
    
    // MARK: - Record Set Errors
    case recordSetIDNotPatron = -11000
    case invalidRecordSetID = -11001
    
    // MARK: - Properties
    public var _code: Int { return self.rawValue }
    public var localizedDescription: String {
        return NSLocalizedString("\(PolarisError.self)_\(self)", tableName: nil, bundle: Bundle.main, value: self.message, comment: "")
    }
    
    public var message: String {
        switch self {
        // General Errors
        case .generalError: return "FAILURE - General."
        case .multipleErrors: return "Multiple errors. See returned rowset for list of errors."
        case .partialError: return "PARTIAL FAILURE - Multiple errors (but some items succeeded). See returned rowset for list of errors."
        case .ermsError: return "FAILURE - ERMS error."
            
        // Bibliographic Errors
        case .invalidBibID: return "Invalid bibliographic record ID specified."
            
        // Item/Holdings Errors
        case .invalidItemID: return "Invalid item record ID specified."
        case .invalidItemBarcode: return "Invalid item barcode specified."
        case .duplicateItemBarcode: return "Duplicate item barcode specified."
        case .itemOut: return "Item has a circulation status of Out."
            
        // Patron Errors
        case .failedToInsertAddress: return "Failed to insert entry in addresses table."
        case .failedToInsertPostalCode: return "Failed to insert entry in postal codes table."
        case .patronInfoChangeNotAllowed: return "Patron person information change is not allowed."
        case .patronDoesNotExist: return "Patron does not exist."
        case .failedToInsertPatron: return "Failed to insert entry in patrons table."
        case .failedToInsertPatronAddress: return "Failed to insert entry in patron addresses table."
        case .countryCodeDoesNotExist: return "Country code does not exist."
        case .patronBranchNotDefined: return "Patron branch is not defined."
        case .patronBranchNotValid: return "Patron branch is not a valid branch."
        case .lastNameNotDefined: return "Last name is not defined."
        case .firstNameNotDefined: return "First name is not defined."
        case .duplicatePatronBarcode: return "Barcode is already used for another patron."
        case .transactionBranchNotDefined: return "Transaction branch is not defined."
        case .transactionUserNotDefined: return "Transaction user is not defined."
        case .transactionWorkstationNotDefined: return "Transaction workstation is not defined."
        case .passwordsDoNotMatch: return "Passwords do not match."
        case .cityStateCountyMismatch: return "Postal code problems - mismatch city, state, county."
        case .cityStateMismatch: return "Postal code problems - mismatch city, state."
        case .cityCountyMismatch: return "Postal code problems - mismatch city, county."
        case .stateCountyMismatch: return "Postal code problems - mismatch state, county."
        case .countyMismatch: return "Postal code problems - mismatch county."
        case .stateMismatch: return "Postal code problems - mismatch state."
        case .cityMismatch: return "Postal code problems - mismatch city."
        case .postalCodeNotFound: return "Postal code problems - postal code not found."
        case .invalidEmail: return "Invalid Email address."
        case .noAddress: return "Invalid DeliveryMethod Value (No Address for Patron)."
        case .noEmail: return "Invalid DeliveryMethod Value (No Email Address for Patron)."
        case .noPhoneVoice1: return "Invalid DeliveryMethod Value (No PhoneVoice1 for Patron)."
        case .noPhoneVoice2: return "Invalid DeliveryMethod Value (No PhoneVoice2 for Patron)."
        case .noPhoneVoice3: return "Invalid DeliveryMethod Value (No PhoneVoice3 for Patron)."
        case .noPhoneFax: return "Invalid DeliveryMethod Value (No PhoneFax for Patron)."
        case .invalidDeliveryMethod: return "Invalid DeliveryMethod Value."
        case .invalidEmailFormat: return "Invalid EmailFormat Value."
        case .invalidReadingList: return "Invalid ReadingList Value."
        case .duplicateName: return "Duplicate name."
        case .duplicateUsername: return "Duplicate username."
        case .failedToInsertPatronRegistration: return "Failed to insert entry in Patron Registration table."
        case .invalidPhoneVoice1: return "Invalid PhoneVoice1 value."
        case .invalidPasswordFormat: return "Invalid password format."
        case .invalidPasswordLength: return "Invalid Password lengh"
        case .passwordChangeNotAllowed: return "Patron password change is not allowed."
        case .invalidChargeTransaction: return "Charge transaction does not exist."
        case .invalidPatronChargeTransaction: return "Charge transaction for this patron does not exist."
        case .invalidPaymentMethod: return "Payment method for payment is invalid."
        case .invalidPaymentAmount: return "Invalid amount is being paid."
        case .invalidTransactionType: return "Invalid transaction type being paid."
        case .generalPatronAccount: return "General patron account database error."
        case .invalidPaymentTransaction: return "Payment transaction does not exist."
        case .invalidPatronPaymentTransaction: return "Payment transaction for this patron does not exist."
        case .transactionCannotBeVoided: return "Payment transaction cannot be voided because another action taken on payment."
        case .paymentMoreThanSum: return "Payment amount is more than the sum of the charges."
        case .invalidPatronCodeID: return "Invalid PatronCodeID."
        case .invalidPhoneVoice2: return "Invalid PhoneVoice2."
        case .invalidPhoneVoice3: return "Invalid PhoneVoice3."
        case .invalidAltEmail: return "Invalid Alt Email Address."
        case .invalidTxtPhoneNumber: return "Invalid TXTPhoneNumber."
        case .invalidPhoneCarrier: return "Invalid PhoneCarrier."
        case .noPhoneForDelivery: return "Invalid DeliveryMethod - No Phone."
        case .invalidReceiptEmail: return "Invalid Email Address for E-Receipt."
        case .patronIsSecure: return "Patron Is Secure."
            
        // Hold Request Errors
        case .invalidApplicationID: return "Invalid application ID supplied."
        case .invalidPatronID: return "Invalid patron ID supplied."
        case .invalidWorkstationIDSupplied: return "Invalid workstation ID supplied."
        case .invalidRequestID: return "Invalid request ID supplied."
        case .invalidRequestingOrgID: return "Invalid requesting org ID supplied."
        case .invalidPatronBarcode: return "Invalid patron barcode."
        case .invalidBibRecordID: return "Invalid bibliographic record ID supplied."
        case .invalidPickupOrgID: return "Invalid pickup organization ID supplied."
        case .cannotChangePickupBranch: return "Cannot change pickup branch for request in statusID."
        case .invalidRequestGUID: return "Invalid request GUID supplied."
        case .invalidTransactionGroup: return "Invalid transaction group qualifier supplied."
        case .invalidTransactionQualifier: return "Invalid transaction qualifier supplied."
        case .invalidAnswer: return "Invalid answer supplied."
        case .invalidState: return "Invalid state supplied."
        case .invalidRequestIDSupplied: return "Invalid request ID supplied."
        case .invalidCurrentOrgID: return "Invalid current organization ID supplied."
        case .cancelDueToHeld: return "Cancel prevented for hold requests with status of Held."
        case .cancelDueToUnclaimed: return "Cancel prevented for hold request with status of Unclaimed."
        case .cancelDueTocancelled: return "Cancel prevented for hold request with a status of Cancelled."
        case .cancelDueToExpired: return "Cancel prevented for hold request with a status of Expired."
        case .cancelDueToOutToPatron: return "Cancel prevented for hold request with a status of Out to Patron."
        case .cancelDueToShipped: return "Cancel prevented for hold request with a status of Shipped."
        case .noRequestsToCancel: return "No requests available to cancel."
        case .invalidApplicationDate: return "Invalid Application date supplied."
        case .needsApplicationDateLaterThanToday: return "Application date must be greater than or equal to today's date."
        case .needsApplicationDateEarlierThanTwoYears: return "Application date must be earlier than 2 years from today."
        case .invalidPickupBranch: return "Invalid pickup branch assigned to hold request."
        case .loadingSA: return "Error occurred loading SA \"days to expire.\""
        case .invalidRequestStatus: return "Request must have a status of Active, Inactive or Pending."
        case .noRequestsToSuspend: return "No requests available to suspend."
        case .invalidRequestStatusForProcess: return "Request status invalid for this process."
        case .invalidRequestStatusChange: return "Invalid request status change requested."
        case .userNotSupplied: return "Invalid hold user not supplied reason."
        case .onlyItemAvailable: return "This is the only item available for hold."
        case .noOtherItemsAvailable: return "No other items at other branches are available to fill this hold."
            
        // Organization Errors
        case .invalidOrgID: return "Invalid OrganizationID specified."
        
        // Circulation Errors
        case .invalidLoanUnit: return "Invalid loan unit supplied."
        case .invalidItemCheckoutRecord: return "ItemCheckout record does not exist."
        
        // Course Reserve Errors
        case .invalidCourseReserveID: return "Invalid CourseReserveID specified."
        
        // PolarisUser Errors
        case .invalidPolarisUserID: return "Invalid PolarisUserID specified."
        case .polarisUserNotPermitted: return "Polaris user is not permitted."
        
        // Workstation Errors
        case .invalidWorkstationID: return "Invalid WorkstationID specified."
        
        // Record Set Errors
        case .recordSetIDNotPatron: return "Supplied recordSetID is not of type patron."
        case .invalidRecordSetID: return "RecordSetID does not exist."
        }
    }
}
