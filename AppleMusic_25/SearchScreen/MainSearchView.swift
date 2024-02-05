import SwiftUI

struct MainSearchView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Divider()
                MainStationView()
                Divider()
                StationView()
            }
            .navigationTitle("Поиск")
        }
    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView()
    }
}
