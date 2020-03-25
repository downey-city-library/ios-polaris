//
//  PolarisConfiguration.swift
//  Polaris
//
//  Created by Andrew Despres on 3/13/19.
//  Copyright © 2019 Downey City Library. All rights reserved.
//

import Foundation

public class PolarisConfiguration {
    
    // Shared Instance
    public static let shared = PolarisConfiguration()
    
    // MARK: - Public Properties
    internal var access = Access()
    internal var staffUser = StaffUser()
    internal var url = URL()
    
    internal struct Access {
        internal var id = ""
        internal var key = ""
    }
    
    internal struct StaffUser {
        internal var domain = ""
        internal var password = ""
        internal var username = ""
    }
    
    internal struct URL {
        internal var protected = ""
        internal var `public` = ""
    }
    
    // MARK: - Public Methods
    /// Print the values for all class properties to the console.
    public static func debugDescription() {
        print("API Access")
        print("-- ID:", shared.access.id)
        print("-- Key:", shared.access.key)
        
        print("\nStaff User:")
        print("-- Domain:", shared.staffUser.domain)
        print("-- Username:", shared.staffUser.username)
        print("-- Password:", shared.staffUser.password)
        
        print("\nURLs:")
        print("-- Protected:", shared.url.protected)
        print("-- Public:", shared.url.public)
    }
    
    // MARK: Initializer
    private init() {
        // Load the plist
        guard let path = Bundle.main.path(forResource: "PolarisAPI-Info", ofType: "plist") else {
            print("Property List 'PolarisAPI-Info' does not exist in this project. Please check that the file has been added to your project and is appropriately linked.")
            return
        }
        
        // Cast contents of plist as dictionary
        guard let plistContents = NSDictionary(contentsOfFile: path) else {
            print("There was a problem reading from the file 'PolarisAPI-Info.plist.' Please check to ensure that the file is a valid property list with all appropriate entries. See documentation for more information.")
            return
        }
        
        // Assign property values
        self.access.id = plistContents.object(forKey: "ACCESS_ID") as? String ?? ""
        self.access.key = plistContents.object(forKey: "ACCESS_KEY") as? String ?? ""
        self.staffUser.domain = plistContents.object(forKey: "DOMAIN") as? String ?? ""
        self.staffUser.password = plistContents.object(forKey: "PASSWORD") as? String ?? ""
        self.staffUser.username = plistContents.object(forKey: "USERNAME") as? String ?? ""
        self.url.protected = plistContents.object(forKey: "URL_PROTECTED") as? String ?? ""
        self.url.public = plistContents.object(forKey: "URL_PUBLIC") as? String ?? ""
    }
}
