import Foundation

struct SuperHero: Codable, Identifiable {
    let id: Int
    let name: String
    let slug: String
    let powerstats: Powerstats?
    let appearance: Appearance?
    let biography: Biography?
    let work: Work?
    let images: Images?
}

struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?
}

struct Biography: Codable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}

struct Work: Codable {
    let occupation: String?
    let base: String?
}

struct Images: Codable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}
