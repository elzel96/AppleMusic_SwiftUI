import SwiftUI

struct StationView: View {
    private var models = RadioModel.models["stations"] ?? []
    
    private let columns = [GridItem(.fixed(UIScreen.main.bounds.width - 40))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .leading) {
                Text("Станции")
                    .font(.headline)
                
                ForEach(models, id: \.self) { model in
                    HStack(spacing: 14) {
                        Image(model.imageName)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading) {
                            Text(model.title)
                                .font(.system(size: 15))
                            
                            Text(model.subTitle ?? "")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    Divider()
                }
            }
        }
        .padding(.leading, 20)
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}

