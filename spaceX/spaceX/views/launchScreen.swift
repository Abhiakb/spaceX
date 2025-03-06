import SwiftUI

struct LaunchesView: View {
    @StateObject private var viewModel = LaunchesViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                
                    // Place the IconView at the top
                    
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(2)
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(viewModel.launches) { launch in
                                    NavigationLink(destination: LaunchDetailView(launch: launch)) {
                                        LaunchCardView(launch: launch)
                                            .padding(.horizontal)
                                            .transition(.opacity) 
                                    }
                                    .buttonStyle(PlainButtonStyle()) 
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
            }
            .navigationTitle("SpaceX Launches")
            .onAppear {
                viewModel.fetchLaunches()
            }
        }
    }





