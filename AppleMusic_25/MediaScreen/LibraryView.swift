import SwiftUI

struct LibraryView: View {
    @State private var mainScreen = true
    @State private var models = Model.models
    
    @ViewBuilder private var screenView: some View {
        if mainScreen {
            NavigationView {
                VStack(alignment: .center) {
                    Text("Ищете свою музыку?")
                        .bold()
                        .font(.system(size: 25))
                        .padding(0.1)
                    Text("Здесь появится купленная Вами в\n iTunes Store музыка.")
                        .font(.system(size: 18))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 100)
                .navigationTitle("Медиатека")
                .navigationBarItems(trailing: Button("Править", action: {
                    mainScreen.toggle()
                })
                    .foregroundColor(.pink))
            }
        } else {
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
                .navigationTitle("Медиатека")
                .navigationBarItems(trailing: Button("Готово", action: {
                    mainScreen.toggle()
                })
                    .foregroundColor(.pink))
            }
        }
    }
    
    var body: some View {
      screenView
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
