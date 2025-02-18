import SwiftUI
import SwiftData
import TipKit

struct AddView: View {
    @State private var title: String = "sample"
    @State private var iconString: String = "key"
    @State private var passwordString: String = ""
    @State private var passwordLength: Int = 4
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    private let viewModel = AddViewModel()
    
    var body: some View {
        NavigationStack {
            PasswordFormView(title: $title, iconString: $iconString, passwordString: $passwordString, passwordLength: $passwordLength)
                .navigationTitle("Add")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(CommonButtonStrings.cancel) {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(CommonButtonStrings.done) {
                            viewModel.add(context, title, iconString, passwordString)
                            dismiss()
                        }
                    }
                }
        }
        .onAppear {
            self.passwordString = CreatePassword.createPassword(length: passwordLength, true, true)
            self.passwordLength = passwordString.count
        }
    }
}

#Preview {
    AddView()
}
