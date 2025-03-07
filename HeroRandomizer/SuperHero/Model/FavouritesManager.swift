import Foundation

final class FavoritesManager: ObservableObject {
    @Published var favorites: [SuperHero] = []
    
    private let favoritesKey = "favorites"
    
    init() {
        loadFavorites()
    }
    
    func isFavorite(hero: SuperHero) -> Bool {
        favorites.contains(where: { $0.id == hero.id })
    }
    
    func addFavorite(hero: SuperHero) {
        if !isFavorite(hero: hero) {
            favorites.append(hero)
            saveFavorites()
        }
    }
    
    func removeFavorite(hero: SuperHero) {
        favorites.removeAll(where: { $0.id == hero.id })
        saveFavorites()
    }
    
    func toggleFavorite(hero: SuperHero) {
        if isFavorite(hero: hero) {
            removeFavorite(hero: hero)
        } else {
            addFavorite(hero: hero)
        }
    }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([SuperHero].self, from: data) {
            favorites = decoded
        }
    }
}
