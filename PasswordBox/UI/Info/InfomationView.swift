import SwiftUI

struct InfomationView: View {
    private let viewModel = InfomationViewModel()
    private let contactUsTitle = "お問い合わせ"
    private let privacyPolicy = "プライバシーポリシー"
    private let releaseNote = "リリースノート"
    private let WebSite = "Webサイト"
    private let licenceTitle = "LICENCE"
    var body: some View {
        List {
            Section("情報") {
                Link(privacyPolicy, destination: URL.InfomationView.privacyPolicy)
                    .openURLInSafariView()

                Link(contactUsTitle, destination: URL.InfomationView.contactURL)
                    .openURLInSafariView()
                
                Link(WebSite, destination: URL.InfomationView.websiteURL)
                    .openURLInSafariView()

                NavigationLink(licenceTitle) {
                    LicenseList()
                        .navigationTitle(licenceTitle)
                }
                
            }
            
            Section {
                LabeledContent("バージョン", value: viewModel.versionString)
            }
        }
        .navigationTitle("アプリ情報")
    }
}

#Preview {
    InfomationView()
}
