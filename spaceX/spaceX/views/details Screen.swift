// Custom Launch Card View
import SwiftUI

struct LaunchCardView: View {
    let launch: Launch
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(launch.missionName)
                .font(.headline)
                .foregroundColor(.white)
            Text(launch.launchDateUTC)
                .font(.subheadline)
                .foregroundColor(.gray)
//            Text(launch.rocket.rocketName)
//                .font(.subheadline)
//                .foregroundColor(.white)
            HStack {
                Text("Status:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(launch.launchSuccess == true ? "Success" : "Failure")
                    .font(.subheadline)
                    .foregroundColor(launch.launchSuccess == true ? .white : .red)
            }
        }
        .frame(width: 320, height: 130)
        .padding()
        .background(
            Image("space")
                .resizable()        
                .scaledToFill()       
                .frame(width: 320, height: 110) 
                .clipped()      
                .opacity(0.5)
                .cornerRadius(10)

        )
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct LaunchDetailView: View {
    let launch: Launch
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let missionPatch = launch.links.missionPatch {
                        AsyncImage(url: URL(string: missionPatch)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 200)
                    }
                    
                    Text(launch.missionName)
                        .font(.title)
                        .foregroundStyle(.white)
                    Text(launch.launchDateUTC)
                        .font(.subheadline)
                        .foregroundStyle(.white)
//                    Text(launch.rocket.rocketName)
//                        .font(.subheadline)
//                        .foregroundStyle(.white)
                    Text(launch.launchSite.siteName)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Text(launch.details ?? "No details available")
                        .font(.body)
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .navigationTitle(launch.missionName)
        }
    }
}

