import SwiftUI

struct SuperHeroInfoView: View {
    var hero: SuperHero
    
    var body: some View {
        texts
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
            .padding(.horizontal, 16)
    }
    
    var texts: some View {
        VStack(alignment: .leading, spacing: 10) {
            (Text("Name: ").bold() + Text(hero.name))
                .frame(width: 300, alignment: .leading)
            
            if let fullName = hero.biography?.fullName, !fullName.isEmpty {
                (Text("Full Name: ").bold() + Text(fullName))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let place = hero.biography?.placeOfBirth, !place.isEmpty {
                (Text("Place of Birth: ").bold() + Text(place))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let firstAppearance = hero.biography?.firstAppearance, !firstAppearance.isEmpty {
                (Text("First Appearance: ").bold() + Text(firstAppearance))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let intelligence = hero.powerstats?.intelligence {
                (Text("Intelligence: ").bold() + Text("\(intelligence)"))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let strength = hero.powerstats?.strength {
                (Text("Strength: ").bold() + Text("\(strength)"))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let speed = hero.powerstats?.speed {
                (Text("Speed: ").bold() + Text("\(speed)"))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let gender = hero.appearance?.gender, !gender.isEmpty {
                (Text("Gender: ").bold() + Text(gender))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let height = hero.appearance?.height?.first, !height.isEmpty {
                (Text("Height: ").bold() + Text(height))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let weight = hero.appearance?.weight?.first, !weight.isEmpty {
                (Text("Weight: ").bold() + Text(weight))
                    .frame(width: 300, alignment: .leading)
            }
            
            if let occupation = hero.work?.occupation, !occupation.isEmpty {
                (Text("Occupation: ").bold() + Text(occupation))
                    .frame(width: 300, alignment: .leading)
            }
        }
    }
}
