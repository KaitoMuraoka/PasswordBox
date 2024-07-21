import SwiftUI
import KeychainAccess

struct EditView: View {
    @State var entry: Entry
    @State private var passwordString: String = ""
    @State private var passwordLength: Int = 1
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    private let viewModel = EditViewModel()
    var body: some View {
        NavigationStack {
            PasswordFormView(title: $entry.title, iconString: $entry.iconString, passwordString: $passwordString, passwordLength: $passwordLength)
                .navigationTitle("Edit")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(CommonButtonStrings.done) {
                            viewModel.save(context, key: entry.id, passwordString)
                            dismiss()
                        }
                    }
                }
        }
        .onAppear {
            load(key: entry.id)
        }
    }
    
    private func load(key: UUID) {
        self.passwordString = PasswordKeychain.shared.readPassword(key: key) ?? ""
        self.passwordLength = passwordString.count
    }
}
