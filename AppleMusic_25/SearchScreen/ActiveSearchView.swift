import SwiftUI

struct ActiveSearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var settings: TextFieldSettings
    @State private var searchModel = MusicSearchModel.models
    
    private let columns = [GridItem(.fixed(UIScreen.main.bounds.width - 40))]
    
    var isLeftState: Bool {
        if settings.text == "Артисты, песни и др." {
            return true
        } else {
            return false
        }
    }
    
    @State private var listSearch = [String]()
    @State private var filteredItems = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("\(Image(systemName: "magnifyingglass")) \(settings.text)", text: $searchText)
                .frame(height: 10)
                .multilineTextAlignment(.leading)
                .padding()
                .background(Color(UIColor.systemGray6))
                .foregroundColor(.gray)
                .cornerRadius(8)
                .onChange(of: searchText) { newValue in
                    filteredItems = listSearch.filter {
                        $0.prefix(newValue.count).lowercased().contains(newValue.lowercased())
                    }
                }
            
            HStack {
                Button {
                    settings.text = "Артисты, песни и др."
                } label: {
                    Text("Apple Music")
                        .font(.system(size: 14))
                        .frame(width: 130, height: 8)
                        .padding()
                        .foregroundColor(.black)
                        .background(isLeftState ? Color.white : Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
                
                Button {
                    settings.text = "Ваша Медиатека"
                } label: {
                    Text("Ваша Медиатека")
                        .font(.system(size: 14))
                        .frame(width: 130, height: 8)
                        .padding()
                        .foregroundColor(.black)
                        .background(isLeftState ? Color(UIColor.systemGray6) : Color.white)
                        .cornerRadius(8)
                }
            }
            .frame(height: 10)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(UIColor.systemGray6))
            }
            
            ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(searchModel.filter({ model in
                    let isTitleMatch = filteredItems.contains(model.title)
                    let isAuthorMatch = filteredItems.contains(model.author)
                    return isTitleMatch || isAuthorMatch
                })
                        , id: \.self) { item in
                    HStack(spacing: 14) {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.system(size: 15))
                            Spacer().frame(height: 2)
                            
                            HStack {
                                Text("\(item.type) ᠂")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                                Text(item.author)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    Divider()
                }
            }
        }
        }
        .padding(.leading, 15)
        .padding(.trailing, 15)
        .onAppear {
            listSearch = searchModel.flatMap { [ $0.title, $0.author] }
        }
    }
}
