import SwiftUI

struct MainStationView: View {
    private var models = RadioModel.models["mainStations"] ?? []
    
    private let rows = [GridItem()]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(models, id: \.self) { model in
                    VStack(alignment: .leading) {
                        Text(model.category ?? " ")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                        
                        Text(model.title)
                            .font(.system(size: 15))
                        
                        Text(model.subTitle ?? " ")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Image(model.imageName)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width) - 40, height: 220)
                            .cornerRadius(6)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
    }
}

struct MainStationView_Previews: PreviewProvider {
    static var previews: some View {
        MainStationView()
    }
}

