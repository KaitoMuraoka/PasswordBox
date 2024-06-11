import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack(spacing: 20) {
            if isUnlocked {
                ListView()
                    .modelContainer(for: Entry.self)
            } else {
                Image.Lock.iphoneIcon
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(4)
                    .padding(.horizontal, 16)
                
                Text("ログイン認証が必要です")
                    .font(.title)
                Text("アプリを使用するには端末の認証が必要です。\n 続けるには**再認証**をしてください")
                    .multilineTextAlignment(.center)

                Button(action: {
                    authenticate()
                }, label: {
                    Text("再認証する")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(25)
                })
            }
        }
        .onAppear {authenticate()}
        .onChange(of: scenePhase, { oldValue, newValue in
            if newValue == .inactive {
                isUnlocked = false
            }
        })
    }
    
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let description = "認証が必要です"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: description) { success, authenticationError in
                DispatchQueue.main.async {
                    self.isUnlocked = success
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
