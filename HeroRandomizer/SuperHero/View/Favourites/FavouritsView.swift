import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            if favoritesManager.favorites.isEmpty {
                emptyFavourites()
            } else {
                favoritesList()
            }
        }
    }
    
    private func emptyFavourites() -> some View {
        VStack {
            Image(systemName: "heart.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("Favorites is empty")
                .font(.title2)
                .foregroundColor(.gray)
        }
    }
    
    private func favoritesList() -> some View {
        List {
            ForEach(favoritesManager.favorites, id: \.id) { hero in
                NavigationLink(
                    destination: SuperHeroDetailView(
                        viewModel: SuperHeroViewModel(preloadedHero: hero),
                        isImageLoaded: .constant(true)
                    )
                    .environmentObject(favoritesManager)
                ) {
                    heroRow(hero: hero)
                }
            }
            .onDelete(perform: deleteFavorite)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Favorites")
    }
    
    private func heroRow(hero: SuperHero) -> some View {
        HStack(spacing: 16) {
            if let imageUrlString = hero.images?.sm,
               let url = URL(string: imageUrlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 50, height: 50)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "exclamationmark.triangle")
                            .frame(width: 50, height: 50)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(hero.name)
                    .font(.headline)
                if let fullName = hero.biography?.fullName, !fullName.isEmpty {
                    Text(fullName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 4)
    }
    
    private func deleteFavorite(at offsets: IndexSet) {
        offsets.forEach { index in
            let hero = favoritesManager.favorites[index]
            favoritesManager.removeFavorite(hero: hero)
        }
    }
}
