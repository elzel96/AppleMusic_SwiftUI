import SwiftUI

struct VerticalStationView: View {
    private var models = RadioModel.models["stations"] ?? []
    
    var body: some View {
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
        
