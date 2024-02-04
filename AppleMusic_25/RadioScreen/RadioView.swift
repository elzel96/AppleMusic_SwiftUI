import SwiftUI

struct RadioView: View {
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Divider()
                MainStationView()
                Divider()
                StationView()
            }
            .navigationTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
