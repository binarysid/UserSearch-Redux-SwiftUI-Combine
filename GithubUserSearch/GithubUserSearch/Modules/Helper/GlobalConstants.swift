import Foundation

struct GlobalConstants {
    struct Common {
        enum Title {
            static let main = "GitUserSearch"
            static let searchBar = "Search..."
        }
        enum Images {
            static let magnifyingGlass = "magnifyingglass"
            static let circleFill = "multiply.circle.fill"
        }
    }

    struct Search {
        enum ErrorMessage {
            static let noUserFound = "No Github User Found"
        }
        enum ActionTitle {
            static let search = "Search"
            static let cancel = "Cancel"
        }
    }
    
    struct UserDetail {
        enum ErrorMessage {
        }
        enum ActionTitle {
        }
    }
}
