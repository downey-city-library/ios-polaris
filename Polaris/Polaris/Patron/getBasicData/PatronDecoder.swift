//
//  PatronDecoder.swift
//  Polaris
//
//  Created by Andrew Despres on 7/24/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

internal struct PatronDecoder {
    internal static func parseBalances(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> Patron.Balances {
        let charges = try data.decode(Double.self, forKey: .chargeBalance)
        let credits = try data.decode(Double.self, forKey: .creditBalance)
        let desposits = try data.decode(Double.self, forKey: .depositBalance)
        
        return Patron.Balances(charges: charges, credits: credits, deposits: desposits)
    }
    
    internal static func parseDate(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>, forKey key: KeyedDecodingContainer<Patron.PatronCodingKeys>.Key) throws -> Date? {
        let dateString = try? data.decode(String.self, forKey: key)
        if let dateString = dateString {
            return PolarisUtility.getDate(from: dateString)
        }
        
        return nil
    }
    
    internal static func parseEmails(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> [Patron.Email] {
        var emails = [Patron.Email]()
        
        let emailAddress1 = try? data.decode(String.self, forKey: .emailAddress1)
        let emailAddress2 = try? data.decode(String.self, forKey: .emailAddress2)
        for address in [emailAddress1, emailAddress2] {
            if let address = address {
                emails.append(Patron.Email(address: address, isPrimary: address == emailAddress1))
            }
        }
        
        return emails
    }
    
    internal static func parseHoldRequestCounts(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> Patron.HoldRequestCounts {
        let holdsHeld = try data.decode(Int.self, forKey: .holdRequestsHeldCount)
        let holdsTotal = try data.decode(Int.self, forKey: .holdRequestsTotalCount)
        let holdsCurrent = try data.decode(Int.self, forKey: .holdRequestsCurrentCount)
        let holdsShipped = try data.decode(Int.self, forKey: .holdRequestsShippedCount)
        let holdsUnclaimed = try data.decode(Int.self, forKey: .holdRequestsUnclaimedCount)
        
        return Patron.HoldRequestCounts(total: holdsTotal, current: holdsCurrent, shipped: holdsShipped, held: holdsHeld, unclaimed: holdsUnclaimed)
    }
    
    internal static func parseItemCounts(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> Patron.ItemCounts {
        let itemsOut = try data.decode(Int.self, forKey: .itemsOutCount)
        let itemsLost = try data.decode(Int.self, forKey: .itemsOutLostCount)
        let itemsOverdue = try data.decode(Int.self, forKey: .itemsOverdueCount)
        
        return Patron.ItemCounts(out: itemsOut, overdue: itemsOverdue, lost: itemsLost)
    }
    
    internal static func parseMessageCounts(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> Patron.MessageCounts {
        let newCount = try data.decode(Int.self, forKey: .messageNewCount)
        let readCount = try data.decode(Int.self, forKey: .messageReadCount)
        
        return Patron.MessageCounts(new: newCount, read: readCount)
    }
    
    internal static func parseName(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> Patron.Name {
        let title = (try? data.decode(Patron.NameTitle.self, forKey: .title)) ?? .none
        let firstName = try data.decode(String.self, forKey: .firstName)
        let middleName = (try? data.decode(String.self, forKey: .middleName)) ?? ""
        let lastName = try data.decode(String.self, forKey: .lastName)
        let suffix = (try? data.decode(String.self, forKey: .suffix)) ?? ""
        
        return Patron.Name(first: firstName, middle: middleName, last: lastName, title: title, suffix: suffix)
    }
    
    internal static func parsePhones(from data: KeyedDecodingContainer<Patron.PatronCodingKeys>) throws -> [Patron.Phone] {
        var phones = [Patron.Phone]()
        
        let cellPhone = try? data.decode(String.self, forKey: .cellPhone)
        let phoneNumber1 = try? data.decode(String.self, forKey: .phoneNumber1)
        let phoneNumber2 = try? data.decode(String.self, forKey: .phoneNumber2)
        let phoneNumber3 = try? data.decode(String.self, forKey: .phoneNumber3)
        
        let phoneCarrier1 = try? data.decode(Patron.PhoneCarrier.self, forKey: .phone1CarrierID)
        let phoneCarrier2 = try? data.decode(Patron.PhoneCarrier.self, forKey: .phone2CarrierID)
        let phoneCarrier3 = try? data.decode(Patron.PhoneCarrier.self, forKey: .phone3CarrierID)
        
        if let phone = mergePhoneData(number: phoneNumber1, carrier: phoneCarrier1, cellNumber: cellPhone) { phones.append(phone) }
        if let phone = mergePhoneData(number: phoneNumber2, carrier: phoneCarrier2, cellNumber: cellPhone) { phones.append(phone) }
        if let phone = mergePhoneData(number: phoneNumber3, carrier: phoneCarrier3, cellNumber: cellPhone) { phones.append(phone) }
        
        return phones
    }
}

fileprivate extension PatronDecoder {
    static func mergePhoneData(number: String?, carrier: Patron.PhoneCarrier?, cellNumber cell: String?) -> Patron.Phone? {
        if let number = number, let carrier = carrier, let cell = cell {
            return Patron.Phone(number: number, carrier: carrier, useForTXT: number == cell)
        }
        
        return nil
    }
}
