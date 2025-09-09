import Foundation

public class PolarisConfiguration {
    
    // Shared Instance
    public static let shared = PolarisConfiguration()
    
    // MARK: - Public Properties
    internal var access = Access()
    internal var staffUser = StaffUser()
    internal var url = URL()
    
    internal struct Access {
        internal var id = "API"
        internal var key = "B33A7CD1-4CCE-4B7D-82D1-B6B876A40FA0"
    }
    
    internal struct StaffUser {
        internal var domain = "HPL"
        internal var password = "Pacapi953"
        internal var username = "dcl-apipac"
        internal var workstation = 91
    }
    
    internal struct URL {
        internal var protected = "https://dcl.polarislibrary.com/PAPIService/REST/protected/v1/1033/100/1"
        internal var `public` = "https://dcl.polarislibrary.com/PAPIService/REST/public/v1/1033/100/1"
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
        print("-- Workstation:", shared.staffUser.workstation)
        
        print("\nURLs:")
        print("-- Protected:", shared.url.protected)
        print("-- Public:", shared.url.public)
    }
}
