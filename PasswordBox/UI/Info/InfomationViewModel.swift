import SwiftUI

struct InfomationViewModel {
    var versionString: String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return version ?? String(localized: "unkown")
    }
    
}
