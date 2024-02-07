import SwiftUI

class TextFieldSettings: ObservableObject {
    @Published var text = "Артисты, песни и др."
}

struct SearchView: View {
    private var models = GenreSearchModel.models
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 2)
    @State private var searchTitle = "Поиск"
    @State private var searchText = ""
    @StateObject var settings = TextFieldSettings()
    @State private var isTextFieldActive = false
    @State private var searchModel = MusicSearchModel.models
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: ActiveSearchView().environmentObject(settings),
                    isActive: $isTextFieldActive,
                    label: {
                        TextField("\(Image(systemName: "magnifyingglass"))  \(settings.text)", text: $searchText)
                            .frame(height: 10)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                            .onTapGesture {
                                isTextFieldActive = true
                            }
                    }
                )
                
                Text("Поиск по категориям")
                        .frame(alignment: .leading)
                        .font(.headline)
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(models, id: \.self) { model in
                                NavigationLink {
                                    DetailsSearchView(title: model.category)
                                } label: {
                                    Image(model.imageName)
                                        .resizable()
                                        .cornerRadius(6)
                                        .frame(height: 115)
                                        .cornerRadius(8)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .onAppear{
                searchTitle = "Поиск"
            }
            .navigationTitle(searchTitle)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
    
    
