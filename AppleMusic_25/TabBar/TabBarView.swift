import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Медиатека")
                }
                .padding(.bottom, 80)
            RadioView()
                .tabItem {
                    Image(systemName: "dot.radiowaves.left.and.right")
                    Text("Радио")
                }
                .padding(.bottom, 80)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
                .padding(.bottom, 80)
            NewSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
                .padding(.bottom, 80)
        }
        .accentColor(.pink)
        .onAppear() {
            UITabBar.appearance().backgroundColor = .systemGray6
        }
        .overlay(alignment: .bottom) {
            MiniPlayerView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

