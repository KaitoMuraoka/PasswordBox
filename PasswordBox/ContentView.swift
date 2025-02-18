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
                
                Text("Login authentication is required")
                    .font(.title)
                Text("You must authenticate your device in order to use the application. \n Please **re-authenticate** to continue")
                    .multilineTextAlignment(.center)

                Button(action: {
                    authenticate()
                }, label: {
                    Text("Re-authenticate")
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
            let description = String(localized: "Authentication required")
            
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
