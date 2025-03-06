
import SwiftUI
struct SpaceXRocketRowView: View {
    let rocket: SpaceXRocket
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: rocket.flickrImages.first ?? "")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(rocket.rocketName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(rocket.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(10)
    }
}

