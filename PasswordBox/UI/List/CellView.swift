import SwiftUI

struct CellView: View {
    @State var entry: Entry
    @Environment(\.modelContext) private var context
    private let dateFormatter = DateFormatter()

    var body: some View {
        HStack {
            Image(systemName: entry.iconString)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .cornerRadius(4)
                .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(entry.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(currentDateString())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    func currentDateString() -> String {
        let date = entry.date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: date)
    }
}

#Preview {
    CellView(entry: Entry(title: "title", iconString: "key"))
}
