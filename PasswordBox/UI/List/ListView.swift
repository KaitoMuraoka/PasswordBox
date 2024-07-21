import SwiftUI
import SwiftData

struct ListView: View {
    @State private var isShowingAddView = false
    @State private var searchText = ""
    @Environment(\.modelContext) private var context
    @Query private var entrys: [Entry]
    var body: some View {
        NavigationStack {
            List {
                ForEach(entrys, id: \.self) { entry in
                    NavigationLink {
                        EditView(entry: entry)
                            .modelContainer(for: Entry.self)
                    } label: {
                        // FIXME: とりあえず今日の時間にしている
                        CellView(entry: entry)
                            .modelContainer(for: Entry.self)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        delete(entry: entrys[index])
                    }
                })
            }
            .navigationTitle("List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isShowingAddView.toggle()
                    } label: {
                        Image.List.addIcon
                    }
                    .sheet(isPresented: $isShowingAddView, content: {
                        AddView()
                            .modelContainer(for: Entry.self)
                    })
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        InfomationView()
                    } label: {
                        Image.List.infoIcon
                    }
                }
            }
            .onAppear{
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Entry] {
        if searchText.isEmpty {
            return entrys
        } else {
            return entrys.filter { $0.title.contains(searchText) }
        }
    }
    
    private func delete(entry: Entry) {
        PasswordKeychain.shared.deletePassword(key: entry.id)
        context.delete(entry)
    }
}

#Preview {
    ListView()
}
