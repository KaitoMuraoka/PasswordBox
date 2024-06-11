import SwiftUI
import WebUI

struct Contact: View {
    let url: URL
    var body: some View {
        WebViewReader { proxy in
            WebView()
                .onAppear {
                    proxy.load(request: URLRequest(url: url))
                }
        }
    }
}

#Preview {
    Contact(url: URL(string: "https://github.com/")!)
}
