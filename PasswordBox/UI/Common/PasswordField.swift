import SwiftUI

struct PasswordField: View {
    let titleKey: LocalizedStringKey
    @Binding var text: String
    @State var isShowSecure = false
    @FocusState var isSecureFieldFocused: Bool
    @State var isFirstEntryAfterToggle = false
    @State private var isPresented = false

    init(_ titleKey: LocalizedStringKey, text: Binding<String>) {
        self.titleKey = titleKey
        _text = text
    }
    
    var body: some View {
        HStack {
            Button {
                isPresented = true
            } label: {
                Text(text)
                    .privacySensitive(isShowSecure)
                    .redacted(reason: .privacy)
            }
            .alert("パスワードを手動で編集", isPresented: $isPresented) {
                TextField("テキストフィールド", text: $text)
                
                Button {
                    print("OK")
                } label: {
                    Text("OK")
                }
            }

            Button {
                if isShowSecure {
                    isShowSecure = false
                    isSecureFieldFocused = true
                    if !text.isEmpty {
                        isFirstEntryAfterToggle = true
                    }
                } else {
                    isShowSecure = true
                    isSecureFieldFocused = false
                    isFirstEntryAfterToggle = false
                }
            } label: {
                Image(systemName: isShowSecure ? "eye.slash" : "eye")
            }
            .buttonStyle(.plain)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.primary, lineWidth: 1)
        )
        .onChange(of: text) { oldValue, newValue in
            if newValue.count == 1 && isFirstEntryAfterToggle {
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                text = oldValue + newValue
            }
        }
    }
}
