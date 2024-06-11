import SwiftUI

struct SettingIconView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding private(set) var title: String
    @Binding private(set) var iconString: String
    var body: some View {
        NavigationStack {
            IconView(title: $title, iconString: $iconString)
                .navigationTitle("アイコンを選択")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("キャンセル") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("完了") {
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
