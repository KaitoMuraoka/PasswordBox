import SwiftUI
import TipKit

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
                .popoverTip(AppTips.ChangeIcon())
            }
            .padding(.bottom, 20)
            
            PasswordField("PasswordField", text: $passwordString)
                .padding()
            
            Button(action: {
                passwordString = CreatePassword.createPassword(
                    length: passwordLength,
                    isAlphabet,
                    isSymbol
                )
            },
                   label: {
                Text("Automatic Password Update")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(25)
            })
            
            Section {
                VStack(spacing: 30) {
                    Stepper(value: $passwordLength, in: 1...100) {
                        Text("number of characters: \(passwordLength)")
                    }
                    
                    Toggle(isOn: $isAlphabet, label: {
                        Text("alphabet")
                    })
                    
                    Toggle(isOn: $isSymbol, label: {
                        Text("symbol")
                    })
                    
                    // TODO: 今後実装
//                    Toggle(isOn: $isNotice, label: {
//                        Text("notice")
//                    })
                }
                .padding(.horizontal, 20)
            }
        }
        .task {
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault),
            ])
        }
    }
}
