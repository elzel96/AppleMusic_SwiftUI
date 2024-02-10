import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            LibraryView()
            .tabItem {
                Image(systemName: "music.note")
                Text("Медиатека")
            }
            RadioView()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
        }
        .accentColor(.pink)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemGray6
        }
        .overlay(alignment: .bottom) {
            PlayerView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

