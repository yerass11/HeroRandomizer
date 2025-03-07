import SwiftUI

struct SuperHeroDetailView: View {
    @ObservedObject var viewModel: SuperHeroViewModel
    @Binding var isImageLoaded: Bool
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        ScrollView {
            if let hero = viewModel.selectedHero,
               let imageUrlString = hero.images?.sm,
               let imageUrl = URL(string: imageUrlString) {
                AsyncImage(url: imageUrl) { phase in
                    switch phase {
                    case .empty:
                        LoadingView(color: .blue)
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        VStack {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                                .onAppear {
                                    isImageLoaded = true
                                }
                            HStack {
                                Text(hero.name)
                                    .font(.title2)
                                Spacer()
                                Button {
                                    favoritesManager.toggleFavorite(hero: hero)
                                } label: {
                                    Image(systemName: favoritesManager.isFavorite(hero: hero) ? "heart.fill" : "heart")
                                        .font(.title2)
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.horizontal)
                            
                            SuperHeroInfoView(hero: hero)
                        }
                    case .failure(_):
                        VStack {
                            LoadingView(color: .red, isFailure: true)
                        }
                        .frame(height: 300)
                    @unknown default:
                        EmptyView()
                    }
                }
                .id(hero.id) // TODO: - change, optimize it
                .transition(.opacity)
                .animation(.easeInOut, value: hero.id)
            } else {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .onAppear {
                        isImageLoaded = true
                    }
            }
        }
    }
}
