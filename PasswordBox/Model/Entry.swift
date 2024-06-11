import Foundation
import SwiftData

@Model
final class Entry: Identifiable {
    var id: UUID = UUID()
    var title: String
    var iconString: String
    var date: Date
    
    init(title: String, iconString: String) {
        self.title = title
        self.iconString = iconString
        self.date = Date()
    }
}
