import SwiftUI

struct InfomationView: View {
    private let viewModel = InfomationViewModel()
    private let contactUsTitle = "お問い合わせ"
    private let releaseNote = "リリースノート"
    private let WebSite = "Webサイト"
    private let licenceTitle = "LICENCE"
    var body: some View {
        List {
            Section("情報") {
                Text("プライバシー")
                
                NavigationLink(contactUsTitle) {
                    Contact(url: URL.InfomationView.contactURL)
                        .navigationTitle(contactUsTitle)
                }
                
                NavigationLink(WebSite) {
                    Contact(url: URL.InfomationView.websiteURL)
                        .navigationTitle(WebSite)
                }

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
