import SwiftUI

struct SecondSectionView: View {
    private var models = RadioModel.models["mainStations"] ?? []
    
    private let rows = [GridItem()]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Настроение")
                    .font(.headline)
                    .padding(.leading, 20)//1ый индекс взять
                
                Button {
                } label: {
                    Text("См. все")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.pink)
                        .padding(.leading, 135)
                }
            }
            
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer().frame(height: 30)
            LazyHGrid(rows: rows, spacing: 1) {
                ForEach(models, id: \.self) { model in
                        Image(model.imageName)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width) - 230, height: 150)
                            .cornerRadius(5)
                    }
                    .padding(.trailing, 20)
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct SecondSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SecondSectionView()
    }
}



