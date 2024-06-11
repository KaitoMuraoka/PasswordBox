import SwiftUI

struct IconView: View {
    @Binding var title: String
    @Binding var iconString: String
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 50, maximum: 75))]
    
    var body: some View {
        List {
            Section {
                VStack {
                    Image(systemName: iconString)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .cornerRadius(4)
                        .padding(.horizontal, 16)
                    
                    TextField(text: $title, axis: .vertical) {
                        Text("リスト名")
                    }
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    
                }
            }
            
            // TODO: 検討中
//            Section {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(IconStyles.colors, id: \.self) { color in
//                            Button{
//                                icon.imageColor = color
//                            } label: {
//                                Image(systemName: icon.imageString)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(height: 40)
//                                    .cornerRadius(4)
//                                    .padding(.horizontal, 16)
//                                    .foregroundStyle(color)
//                            }
//                        }
//                    }
//                }
//            }
            
            Section {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(IconStyles.symbols, id: \.self) { symbol in
                            VStack {
                                Button{
                                    iconString = symbol
                                } label: {
                                    Image(systemName: symbol)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    IconView(title: .constant("title"), iconString: .constant("key"))
}
