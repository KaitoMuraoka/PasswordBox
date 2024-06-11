import Foundation

struct CreatePassword {
    
    static func createPassword(length: Int, _ isAlphabet: Bool, _ isSymbol: Bool) -> String {
        var letters = "0123456789"
        if isAlphabet {
            letters += "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
        if isSymbol {
            letters += "!@#$%^&*_?+-~"
        }
        return CreatePassword.generator(length, letters)
    }
    
    private static func generator(_ length: Int, _ letters: String) -> String {
        var randomString = ""
        for _ in 0 ..< length {
            randomString += String(letters.randomElement()!)
        }
        return randomString
    }
}
