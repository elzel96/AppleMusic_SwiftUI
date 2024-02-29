import SwiftUI

struct ListView: View {
    @State private var models = Model.models
    
    var body: some View {
        NavigationView {
            List {
                ForEach(models.indices, id: \.self) { index in
                    HStack {
                        Image(systemName: models[index].isPicked ? "checkmark.circle.fill" : "circle")
                            .font(.system(size: 20))
                                            .foregroundColor(.pink)
                                            .onTapGesture {
                                                models[index].isPicked.toggle()
                                                Model.models[index].isPicked.toggle()
                                            }
                        ModelCell(model: models[index])
                    }
                }
                .onMove(perform: { IndexSet, index in
                    self.models.move(fromOffsets: IndexSet, toOffset: index)
                    Model.models = self.models
                }
                )
            }
            .listStyle(.plain)
        }
        .navigationTitle("Медиатека")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Готово") {
                    LibraryView()
                        .navigationBarBackButtonHidden(true)
                }.accentColor(Color.pink)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
