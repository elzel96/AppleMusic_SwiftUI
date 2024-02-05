import SwiftUI

struct DetailsSearchView: View {
    @State var title: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            MainStationView()
            Spacer().frame(height: 20)
            SecondSectionView()
        }
        .navigationTitle(title)
    }
}

