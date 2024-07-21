import SwiftUI

struct SettingIconView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding private(set) var title: String
    @Binding private(set) var iconString: String
    var body: some View {
        NavigationStack {
            IconView(title: $title, iconString: $iconString)
                .navigationTitle("Select Icon")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(CommonButtonStrings.cancel) {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(CommonButtonStrings.done) {
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    SettingIconView(title: .constant("title"), iconString: .constant("key"))
}
