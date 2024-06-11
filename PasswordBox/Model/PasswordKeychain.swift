import Foundation
import KeychainAccess

struct PasswordKeychain {
    static let shared = PasswordKeychain()
    private let keychain = Keychain(service: "com.passwordbox.password")
    
    func savePassword(key: UUID, password: String) {
        let keyString = key.uuidString
        keychain[keyString] = password
    }
    
    func deletePassword(key: UUID) {
        do {
            let keyString = key.uuidString
            try keychain.remove(keyString)
        } catch let error {
            print("error: \(error)")
        }
    }
    
    func readPassword(key: UUID) -> String? {
        let keyString = key.uuidString
        return keychain[keyString]
    }
}
