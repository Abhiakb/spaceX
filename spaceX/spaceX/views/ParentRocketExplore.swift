import SwiftUI
struct SpaceExploreViww: View {
    @StateObject var viewModel = SpaceXRocketViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.rockets) { rocket in
                NavigationLink(destination: SpaceXRocketDetailView(rocket: rocket)) {
                    SpaceXRocketRowView(rocket: rocket)
                }
            }
            .navigationTitle("SpaceX Rockets")
            .onAppear {
                viewModel.fetchRockets()
            }
        }
    }
}
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LaunchesView()
                .tabItem {
                    VStack {
                        Image(systemName: "satellite")
                        Text("Launches")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .tag(0)
            
            SpaceExploreViww()
                .tabItem {
                    VStack {
                        Image(systemName: "rocket")
                        Text("Explore")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .tag(1)
        }
    }
}

