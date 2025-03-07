import SwiftUI

struct SuperHeroView: View {
    @ObservedObject var viewModel: SuperHeroViewModel
    @State var isImageLoaded = false

    var body: some View {
        VStack {
            SuperHeroDetailView(
                viewModel: viewModel, isImageLoaded: $isImageLoaded
            )
            .padding(.horizontal, 24)
            
            Spacer()
            
            generateButton
        }
        .padding(.top, 1)
    }
    
    var generateButton: some View {
        Button {
            Task {
                isImageLoaded = false
                await viewModel.fetchHeroes()
            }
        } label: {
            Text("Generate a SuperHero")
                .font(.title)
                .padding()
                .background(isImageLoaded
                            ? Color.green
                            : Color.green.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(16)
        }
        .disabled(viewModel.selectedHero != nil && !isImageLoaded)
        .padding(.bottom)
    }
}

#Preview {
    let viewModel = SuperHeroViewModel()
    SuperHeroView(viewModel: viewModel)
        .environmentObject(FavoritesManager())
}
