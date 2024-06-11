import Foundation
import SwiftData

final class AddViewModel {
    func add(_ context: ModelContext ,_ title: String, _ icon: String, _ password: String) {
        let data = Entry(title: title, iconString: icon)
        context.insert(data)
        let id = data.id
        PasswordKeychain.shared.savePassword(key: id, password: password)
    }
}
