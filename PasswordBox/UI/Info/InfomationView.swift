import SwiftUI

struct InfomationView: View {
    private let viewModel = InfomationViewModel()
    var body: some View {
        List {
            Section("Infomation") {
                Link("Privacy Policy", destination: URL.InfomationView.privacyPolicy)
                    .openURLInSafariView()

                Link("Contact Us", destination: URL.InfomationView.contactURL)
                    .openURLInSafariView()
                
                Link("WebSite", destination: URL.InfomationView.websiteURL)
                    .openURLInSafariView()

                NavigationLink("LICENCE") {
                    LicenseList()
                }
                
            }
            
            Section {
                LabeledContent("Version", value: viewModel.versionString)
            }
        }
        .navigationTitle("App Infomation")
    }
}

#Preview {
    InfomationView()
}
