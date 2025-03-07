import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SuperHeroViewModel()
    @StateObject private var favoritesManager = FavoritesManager()
    
    var body: some View {
        TabView {
            SuperHeroView(viewModel: viewModel)
                .tabItem {
                    Label("Random Hero", systemImage: "bolt.fill")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
        .environmentObject(favoritesManager)
    }
}

#Preview {
    ContentView()
}
