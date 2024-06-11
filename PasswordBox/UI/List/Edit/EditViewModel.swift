import Foundation
import SwiftData

final class EditViewModel {
    func save(_ context: ModelContext, key: UUID, _ password: String) {
        try? context.save()
        PasswordKeychain.shared.savePassword(key: key, password: password)
    }
}
