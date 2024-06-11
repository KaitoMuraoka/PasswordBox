import SwiftUI

struct PasswordFormView: View {
    @Binding var title: String
    @Binding var iconString: String
    @Binding var passwordString: String
    @Binding var passwordLength: Int
    @State private var isAlphabet: Bool = true
    @State private var isSymbol: Bool = true
    @State private var isNotice: Bool = true
    @State private var isTitlePresented = false
    @State private var isShowingIconView = false
    var body: some View {
        VStack {
            HStack {
                Button {
                    isShowingIconView.toggle()
                } label: {
                    Image(systemName: iconString)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .cornerRadius(4)
                        .padding(.horizontal, 16)
                    
                    Text(title)
                        .font(.largeTitle)
                        .padding(.horizontal, 16)
                }
                .sheet(isPresented: $isShowingIconView, content: {
                    SettingIconView(title: $title, iconString: $iconString)
                })
            }
            .padding(.bottom, 20)
            
            Text("Password")
                .font(.title)
            PasswordField("PasswordField", text: $passwordString)
            
            Button(action: {
                print("更新します")
                passwordString = CreatePassword.createPassword(
                    length: passwordLength,
                    isAlphabet,
                    isSymbol
                )
            },
                   label: {
                Text("パスワードを自動更新")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(25)
            })
            
            Section {
                VStack(spacing: 30) {
                    Stepper(value: $passwordLength, in: 1...100) {
                        Text("文字数: \(passwordLength)")
                    }
                    
                    Toggle(isOn: $isAlphabet, label: {
                        Text("アルファベット")
                    })
                    
                    Toggle(isOn: $isSymbol, label: {
                        Text("記号")
                    })
                    
                    // TODO: 今後実装
//                    Toggle(isOn: $isNotice, label: {
//                        Text("通知")
//                    })
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
