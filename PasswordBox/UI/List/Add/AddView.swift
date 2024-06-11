import SwiftUI
import SwiftData

struct AddView: View {
    @State private var title: String = "sample"
    @State private var iconString: String = "key"
    @State private var passwordString: String = "SamplePassword"
    @State private var passwordLength: Int = 4
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    private let viewModel = AddViewModel()
    var body: some View {
        NavigationStack {
            PasswordFormView(title: $title, iconString: $iconString, passwordString: $passwordString, passwordLength: $passwordLength)
                .navigationTitle("追加")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("キャンセル") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("完了") {
                            viewModel.add(context, title, iconString, passwordString)
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    AddView()
}
