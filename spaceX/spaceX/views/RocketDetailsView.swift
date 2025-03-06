
import SwiftUI
struct SpaceXRocketDetailView: View {
    let rocket: SpaceXRocket
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: rocket.flickrImages.first ?? "")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            .cornerRadius(10)
            
            Text(rocket.rocketName)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
            
            Text(rocket.description)
                .foregroundColor(.gray)
                .padding()
            
            HStack {
                Text("First Flight: \(rocket.firstFlight)")
                Spacer()
                Text("Cost: $\(rocket.costPerLaunch) per launch")
            }
            .foregroundColor(.white)
            .padding()
        }
        .padding()
        .background(Color.black.opacity(0.9))
        .cornerRadius(10)
        .padding()
    }
}



