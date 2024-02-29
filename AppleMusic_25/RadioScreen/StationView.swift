import SwiftUI

struct StationView: View {
    private let columns = [GridItem(.fixed(UIScreen.main.bounds.width - 40))]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .leading) {
                VerticalStationView()
            }
        }
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}

