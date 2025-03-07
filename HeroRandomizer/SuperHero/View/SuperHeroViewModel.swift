import Foundation

@MainActor
final class SuperHeroViewModel: ObservableObject {
    @Published var selectedHero: SuperHero?
    let url = URL(string: "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json")!

    func fetchHeroes() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let heroes = try JSONDecoder().decode([SuperHero].self, from: data)
            guard let randomHero = heroes.randomElement() else {
                print("No heroes available.")
                return
            }
            selectedHero = randomHero
        }
        catch {
            print("Error: \(error)")
        }
    }
}

extension SuperHeroViewModel {
    convenience init(preloadedHero: SuperHero) {
        self.init()
        self.selectedHero = preloadedHero
    }
}
