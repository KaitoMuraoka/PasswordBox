import SwiftUI
import LicenseList

struct LicenseList: View {
    var body: some View {
            LicenseListView()
                // If you want to anchor link of the repository
                .licenseListViewStyle(.withRepositoryAnchorLink)
    }
}

#Preview {
    LicenseList()
}
