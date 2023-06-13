import Foundation

public struct Polaris {
    
    // MARK: - PROPERTIES
    static public internal(set) var authenticatedPatron: Authenticate.AuthenticatedPatron?
    static public internal(set) var authenticatedStaffUser: Authenticate.AuthenticatedStaffUser?
    
    public struct Authenticate {
        
        public typealias AuthenticatedPatron = AuthenticatePatronResponse
        public typealias AuthenticatedStaffUser = AuthenticateStaffResponse
    }
    
    public struct Bib {}
    
    public struct HoldRequest {}
    
    public struct ILLRequest {}
    
    public struct Item {}
    
    public struct Patron {
        
        public struct Account {}
        public struct Blocks {}
        public struct Message {}
        public struct ReadingHistory {}
        public struct Registration {}
        public struct TitleList {}
    }
    
    public struct RecordSet {}
    
    public struct System {}
}
