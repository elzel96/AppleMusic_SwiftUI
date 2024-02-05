import SwiftUI

struct SearchView: View {
    private var models = GenreSearchModel.models
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 2)
    @State var searchTitle = "Поиск"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
          //      TextField("First name", text: $user.userModel.firstName) // !!
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
