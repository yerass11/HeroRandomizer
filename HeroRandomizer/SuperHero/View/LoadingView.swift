import SwiftUI

struct LoadingView: View {
    var color: Color
    var isFailure: Bool = false
    
    var body: some View {
        VStack(spacing: 48) {
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2.5)
                .tint(color)
            if isFailure {
                Text("Ошибка загрузки")
                    .foregroundColor(.red)
                    .font(.title3)
                    .bold()
            }
        }
    }
}

#Preview {
    LoadingView(color: .red, isFailure: true)
}
